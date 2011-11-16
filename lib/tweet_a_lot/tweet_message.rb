module TweetALot
  class TweetMessage

    include MongoMapper::Document
    belongs_to :orig_tweet, :class_name => "TweetALot::TweetMessage"
    one :user, :class_name => "TweetALot::User"

    key :twitter_id, Integer
    key :message, String
    key :created_at, Time
    key :urls, Array

    def retweets
      self.class.all(:orig_tweet_id => id)
    end

    def scorer
      @scorer ||= TweetALot::Score.new
    end

    after_save do
      u = (is_a_retweet? ? orig_tweet.user : user)

      unless player = TweetALot::Player.first(:twitter_id => u.twitter_id)
        player = TweetALot::Player.create(
          :twitter_id => u.twitter_id,
          :screen_name => u.screen_name,
          :profile_image_url => u.profile_image_url
        )
      end

      score = (is_a_retweet? ? 10 : scorer.calculate(self))
      player.add_score(score)
    end

    def is_a_retweet?
      !!orig_tweet
    end

    def self.create_from_hash(hash)
      if hash[:retweeted_status]
        orig_tweet = TweetALot::TweetMessage.first(:twitter_id => hash[:retweeted_status][:id])
        return nil unless orig_tweet # if tweet that was retweeted isn't in db, just ignore it
      end

      t = TweetALot::TweetMessage.new(:twitter_id => hash[:id])
      t.message = hash[:text]
      t.orig_tweet = orig_tweet
      t.created_at = (DateTime.parse(hash[:created_at]).to_time) rescue nil
      t.user = TweetALot::User.new(
        :twitter_id => hash[:user][:id],
        :screen_name => hash[:user][:screen_name],
        :profile_image_url => hash[:user][:profile_image_url],
        :followers_count => hash[:user][:followers_count],
        :friends_count => hash[:user][:friends_count]
      )
      urls = hash[:entities][:urls] || [] rescue []
      t.urls = urls.collect{|u| u[:expanded_url] || u['expanded_url'] }
      t.save!
      t
    # rescue
    #   nil
    end

    def pretty_print
      puts %(twitter_id: #{twitter_id}
orig_tweet: #{orig_tweet.inspect}
created_at: #{created_at}
user: #{user.inspect}
urls: #{urls.inspect}
message: #{message})
    end

  end
end