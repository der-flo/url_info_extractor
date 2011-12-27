class UrlInfoExtractor
  module Favicon
    def favicon_url
      base = fetched_data[:base_link_value]
      uri = base ? URI.parse(base) : @uri
      link = fetched_data[:favicon_link_value]
      link ||= '/favicon.ico'
      uri.merge(URI.parse(link)).to_s
    end
    def favicon_exists?
      response = do_http_request(favicon_url, :head)
      response.is_a? Net::HTTPSuccess
    end
  end
end

