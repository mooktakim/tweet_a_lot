source 'http://rubygems.org'

gem 'rails', '~> 3.1.1'

gem 'unicorn'
gem "bcrypt-ruby", '~> 3.0.0', :require => "bcrypt"

group :assets do
  gem 'sass-rails', "~> 3.1.4"
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier', '>= 1.0.3'
  gem 'execjs'
  gem 'therubyracer'
  gem "compass", "~> 0.12.alpha.0"
  gem "oily_png" # Speed up sprite generating
end

gem 'jquery-rails'
gem "inherited_resources", "~> 1.2.2"
gem "haml-rails", "~> 0.3.4"

gem 'dalli'
gem 'rack-cache', :require => 'rack/cache'
gem 'keytar'

gem "mongo_mapper", "~> 0.9.2"
gem "bson_ext", "~> 1.3"

gem "tweetstream"
gem "yajl-ruby" #, :require => 'yajl'
gem "embedly"
gem 'handlebars_assets'
gem "rails_autolink", "~> 1.0.4"

group :development, :test do
  gem 'turn', :require => false
  gem "heroku", :require => false
  gem "taps", :require => false
  gem "awesome_print"
  gem "heroku_deployment", :require => false
  gem "git_remote_branch", :require => false
  gem 'foreman', :require => false

  gem "rspec-rails"
  gem "guard-rspec"
  gem "rb-fsevent", :require => false
  gem "spork", "~> 0.9.0.rc9"
  gem 'guard-spork'
  gem 'database_cleaner'
end