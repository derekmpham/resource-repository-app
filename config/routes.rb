Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :resources
  get '/tags/new'
  post '/tags'
  root 'users#index'
end
