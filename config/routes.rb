SkillShare::Application.routes.draw do
  resources :users

  # Generate login routes
   match 'user/edit' => 'users#edit', :as => :edit_current_user
   match 'signup' => 'users#new', :as => :signup
   match 'logout' => 'sessions#destroy', :as => :logout
   match 'login' => 'sessions#new', :as => :login
   resources :users
   resources :sessions
  
  resources :workshops

  resources :subscriptions

  resources :upvotes

  resources :sharers

  resources :learners

    # Semi-static page routes
    match 'home' => 'home#index', :as => :home





    # Set the root url
    root :to => 'home#index'

end







