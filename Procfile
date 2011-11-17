web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
# worker: bundle exec ruby ./bin/stream '#HumanWrites' '#HumanWrites2' '#HumanWritesII'
worker: bundle exec ./script/rails runner "TwitterStream.new(['#HumanWrites' '#HumanWrites2' '#HumanWritesII']).run"