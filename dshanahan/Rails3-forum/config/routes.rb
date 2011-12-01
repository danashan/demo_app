Rails3Forums::Application.routes.draw do
 get "sessions/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  get "users/new"

   match '/signup',  :to => 'users#new'
   match '/signin',  :to => 'sessions#new'
   match '/signout', :to => 'sessions#destroy'


  resources :topics, :shallow => true do
    resources :posts
  end

  resources :forums, :shallow => true do
    resources :topics
  end

  root :to => "forums#index"

  #route all unmatched routes to root
  #match '*a', :to => redirect(:root)
end
