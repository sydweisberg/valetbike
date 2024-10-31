Rails.application.routes.draw do
  root to: "stations#index"
  get '/bikes', to: 'bikes#index'
  get '/stations', to: 'stations#index'
  get '/stations/:id', to: 'stations#show', as: 'station'
  get '/rentals', to: 'rentals#index'
  get '/users', to: 'users#index'
end
