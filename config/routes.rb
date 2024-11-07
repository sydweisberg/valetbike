Rails.application.routes.draw do
  root to: "home#index"
  get '/bikes', to: 'bikes#index'
  get '/stations', to: 'stations#index'
  get '/stations/:id', to: 'stations#show', as: 'station'
  get '/rentals', to: 'rentals#index'
  resources :rentals, only: [:create]
  get '/users', to: 'users#index'
  get '/about', to: 'about#index'
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, only: [:create]
  get '/users/:id', to: 'users#show', as: 'user'
  get '/signin', to: 'signin#index'
end
