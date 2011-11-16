dir = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)

require 'sinatra'
require 'tweet_a_lot'

get '/' do
  content_type :text
  TweetALot::Player.score_board
end