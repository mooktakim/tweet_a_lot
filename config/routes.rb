TweetALot::Application.routes.draw do

  resources :players, :only => [:index, :show]
  match 'recent_tweets(.:format)' => 'welcome#recent', :as => :recent_tweets
  match 'scores(.:format)' => 'welcome#scores', :as => :scores
  root :to => 'welcome#index'

end
