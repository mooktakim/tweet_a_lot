class TwitterStream

  attr_reader :keywords

  def initialize(*words)
    @keywords = words.flatten
    raise "Please provide a valid keyword" if keywords.nil? or keywords.empty?
  end

  def client
    @client ||= TweetStream::Client.new
  end

  def run
    puts "Stream started - #{Time.now}"
    client.track(*keywords) do |status, cclient|
      if Rails.env.development?
        puts "#{status.inspect}"
        puts "="*100
        if tweet = TweetMessage.create_from_hash(status)
          tweet.pretty_print
          Player.print_score_board
        end
      else
        TweetMessage.create_from_hash(status)
      end
    end
  end

end