# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tweet_a_lot/version', __FILE__)

Gem::Specification.new do |gem|

  gem.authors       = ["Mooktakim Ahmed"]
  gem.email         = ["Mooktakim@fluxter.co.uk"]
  gem.description   = %q{A twitter game to encourage people to tweet.}
  gem.summary       = %q{Tweet-A-Lot Competition Webapp}
  gem.homepage      = "http://www.restlessbeings.org"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "tweet_a_lot"
  gem.require_paths = ["lib"]
  gem.version       = TweetALot::VERSION

  %w(rspec bundler jeweler rcov guard guard-rspec rb-fsevent).each do |g|
    gem.add_development_dependency g
  end

  gem.add_dependency "tweetstream"
  gem.add_dependency "yajl-ruby" #, :require => 'yajl'

end