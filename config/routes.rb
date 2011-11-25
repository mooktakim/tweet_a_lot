TweetALot::Application.routes.draw do

  resources :players, :only => [:index, :show]
  match 'scores(.:format)' => 'welcome#scores', :as => :scores
  root :to => 'welcome#index'

end
