module TweetALot
  class Score

    def calculate(tweet)
      return 1 if tweet.urls.empty?
      url_types(tweet.urls).collect do |typ|
        case typ
        when :video
          10
        when :photo, :image
          5
        when :rb_url
          2
        else
          1
        end
      end.max
    end

    private

    def client
      @client ||= Embedly::API.new(:key => ENV['EMBEDLY_KEY'])
    end

    def url_types(urls)
      # expand shortened urls
      urls = urls.compact.uniq.collect{|u| TweetALot::ExpandUrl.expand(u)}
      result = []

      urls = urls.reject do |u|
        result << :rb_url if u.match(/restlessbeings\.org/i)
      end.compact.uniq

      unless urls.empty?
        objs = client.oembed(:urls => urls)
        objs.each do |obj|
          result << obj.type.to_sym unless obj.type.to_s == ""
        end
      end
      result.compact.uniq
    end

  end
end