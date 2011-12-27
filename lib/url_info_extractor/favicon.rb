class UrlInfoExtractor
  module Favicon
    def favicon_url
      @uri.merge(URI.parse(fetched_data[:favicon_link_value])).to_s
    end
  end
end

