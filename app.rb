require 'sinatra'
require 'tweet_a_lot'

get '/' do
  content_type :text
  TweetALot::Player.score_board
end