Rails3Forums::Application.routes.draw do
  resources :users

 # match 'home' => 'home#index', :as => :home

  resources :topics do
    resources :posts
  end

  resources :forums do
    resources :topics
  end

  root :to => "forums#index"

  #route all unmatched routes to root
  #match '*a', :to => redirect(:root)
end
