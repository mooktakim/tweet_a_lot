module TweetALot
  class Stream

    attr_reader :keywords

    def initialize(*words)
      @keywords = words.flatten
      raise "Please provide a valid keyword" if keywords.nil? or keywords.empty?
    end

    def client
      @client ||= TweetStream::Client.new
    end

    def run
      client.track(*keywords) do |status, cclient|
        puts "#{status.inspect}"
        puts "="*100
        if tweet = TweetALot::TweetMessage.create_from_hash(status)
          tweet.pretty_print
          Player.print_score_board
        end
      end
    end

  end
end
