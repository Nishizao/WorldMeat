Rails.application.routes.draw do
  
  resources :recettes
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  post 'users', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', :to => 'sessions#destroy'
  
end
