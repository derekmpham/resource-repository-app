Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :resources

  resources :favorites
  get '/tags/new', to: 'tags#new'
  post '/tags', to: 'tags#create'
  get '/favorites/new', to: 'favorites#show'
  post '/favorites', to: 'favorites#create'

  root 'application#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/search' => 'resources#search'


end
