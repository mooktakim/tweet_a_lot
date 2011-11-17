namespace :tweet_a_lot do

  desc "Listen to the Twitter stream"
  task :stream => :environment do
    TwitterStream.new(['#HumanWrites' '#HumanWrites2' '#HumanWritesII']).run
  end

end