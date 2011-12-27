require "url_info_extractor/version"
require 'url_info_extractor/favicon'
require 'nokogiri'
require 'active_support'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/string/inflections'
require 'net/https'

class UrlInfoExtractor
  include Favicon

  class SchemeNotSupported < StandardError; end

  def initialize(url)
    @uri = URI.parse(url)
    @path = @uri.path
    @path = '/' if @path.empty?
  end
  def title
    fetched_data[:title]
  end

  def description
    fetched_data[:description]
  end

  def scheme_supported?
    %w(http https).include? @uri.scheme
  end

  private

  PROCESSABLE_MIME_TYPES = %w(application/xhtml+xml text/html)

  def fetched_data
    @fetched_data ||= fetch_data
  end

  def fetch_data
    raise SchemeNotSupported unless scheme_supported?
    response = do_http_request(@path, :get)

    return {} unless PROCESSABLE_MIME_TYPES.include?(response.content_type)

    doc = Nokogiri::HTML(response.body)
    head = doc.css('html head')

    { title: head.css('title').try(:first).try(:content),
      description:
        head.css('meta[name=description]').try(:first).try(:[], 'content'),
      favicon_link_value:
        head.css('link[rel~=icon]').try(:first).try(:[], 'href'),
      base_link_value: head.css('base').try(:first).try(:[], 'href')
    }
  end

  def do_http_request(path, method)
    request = "Net::HTTP::#{method.to_s.camelize}".constantize.new(path)
    Net::HTTP.start(@uri.host, @uri.port,
                    use_ssl: @uri.scheme == 'https') do |http|
      http.request request
    end
  end
end

