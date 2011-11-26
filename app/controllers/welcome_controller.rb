class WelcomeController < ApplicationController

  def index
    expires_in 5.minutes, :public => true
  end

  def recent
    expires_in 5.seconds
    render :partial => "welcome/tweets", :locals => {:tweets => TweetMessage.sort(:_id.desc).limit(20).all}, :layout => false
  end

  def scores
    json = Rails.cache.fetch(Player.scores_key) do
      scores = Player.scores.all
      scores.each_with_index do |s,i|
        s[:position] = i+1
        s[:url] = player_path(s)
      end
      scores.to_json
    end
    # fresh_when :etag => Rails.cache.read(Player.etag_key)
    expires_in 3.seconds, :public => true
    render :json => json
  end

end
