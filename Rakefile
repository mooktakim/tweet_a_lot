#!/usr/bin/env rake
require "bundler/gem_tasks"

dir = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)

require 'tweet_a_lot'

namespace :tweet_a_lot do

  desc "Listen to the Twitter stream"
  task :stream do
    TweetALot::Stream.new(['#HumanWrites' '#HumanWrites2' '#HumanWritesII']).run
  end

end