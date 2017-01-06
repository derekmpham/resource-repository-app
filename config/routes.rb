Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :resources
  resources :favorites
  get '/tags/new', to: 'tags#show'
  post '/tags', to: 'tags#create'
  root 'users#index'
  get '/favorites/new', to: 'favorites#show'
  post '/favorites', to: 'favorites#create'
end
