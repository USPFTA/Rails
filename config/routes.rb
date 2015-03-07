Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions'}
  resources :users
  get '/games/:id', to: 'games#show'
  post '/games/new', to: 'games#create'
  get '/games/:id/admin', to: 'games#index'
  post '/games/:id/finished', to: 'games#finished'
end
