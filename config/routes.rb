Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions'}
  resources :users
  get '/games/:id', to: 'games#show'
  post '/games/new', to: 'games#create'
  get '/games/:id/admin', to: 'games#index'
  post '/games/:id/finished', to: 'games#finished'

  get  '/invitations/users/:id', to: 'invitations#my_invitations'
  post '/invitations/:id/accept', to: 'invitations#accept_invitation'
  post '/invitations/:id/decline', to: 'invitations#decline_invitation'


  resources :invitations, :only => [:create, :show, :index]
  resources :flags, :only => [:create, :show, :index, :destroy]
  resources :tags, :only => [:create]
end
