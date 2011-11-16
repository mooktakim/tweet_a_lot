require 'tweetstream'
require 'yajl'
require 'mongo_mapper'
require 'embedly'
require 'json'

%w(version expand_url stream tweet_message user player score).each do |f|
  require "tweet_a_lot/#{f}"
end

module TweetALot

end

TweetStream.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']

  config.auth_method = :oauth
  config.parser = :yajl
end

RACK_ENV = ENV['RACK_ENV'] || 'development'
MONGOHQ_URL = ENV['MONGOHQ_URL'] || "mongodb://localhost/tweet_a_lot_#{RACK_ENV}"

MongoMapper.config = { RACK_ENV => { 'uri' => MONGOHQ_URL } }
MongoMapper.connect(RACK_ENV)
