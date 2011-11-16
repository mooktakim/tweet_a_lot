require 'net/http'

module TweetALot
  module ExpandUrl

    def self.expand(url, count = 0)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      path = (uri.path.to_s == "" ? '/' : uri.path)
      resp = http.request_head(path)
      if resp.is_a?(Net::HTTPRedirection) && count < 5
        self.expand(resp['Location'], count+1)
      else
        url
      end
    end

  end
end
