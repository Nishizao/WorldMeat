Rails.application.routes.draw do
  
  resources :recettes
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  
end
