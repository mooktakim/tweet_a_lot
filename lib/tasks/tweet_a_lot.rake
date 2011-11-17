namespace :tweet_a_lot do

  desc "Listen to the Twitter stream"
  task :stream do
    TwitterStream.new(['#HumanWrites' '#HumanWrites2' '#HumanWritesII']).run
  end

end