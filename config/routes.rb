Rails.application.routes.draw do

  root 'welcome#index'

  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'
  post '/rides/new', to: 'rides#new'
  
  resources :attractions
  resources :users


end