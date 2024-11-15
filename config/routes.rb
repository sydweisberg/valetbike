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
  resources :rentals
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
resources :bikes do
  member do
    patch 'return'  # PATCH request to handle the return action for a specific rental
  end
end

end
