class PlayersController < ApplicationController

  inherit_resources
  actions :index, :show

  def index
    @players = Player.sort(:score.desc).all
    expires_in 10.minutes, :public => true
  end

end
