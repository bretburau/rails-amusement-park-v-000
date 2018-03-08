Rails.application.routes.draw do
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  post '/signout',  to: 'sessions#destroy'
  root 'users#index'
  post '/attractions/:id/ride', to: 'attractions#ride', as: 'ride'
  resources :users, :attractions
end