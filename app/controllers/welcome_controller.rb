class WelcomeController < ApplicationController

  def index
    expires_in 1.hours, :public => true
  end

  def scores
    json = Rails.cache.fetch(Player.scores_key) { Player.scores.all.to_json }
    # fresh_when :etag => Rails.cache.read(Player.etag_key)
    expires_in 3.seconds, :public => true
    render :json => json
  end

end
