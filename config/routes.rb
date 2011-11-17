TweetALot::Application.routes.draw do

  match 'scores(.:format)' => 'welcome#scores', :as => :scores
  root :to => 'welcome#index'

end
