Rails.application.routes.draw do
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :users, only: [ :show ]
  resources :tweets, except: [ :show, :edit, :update ]
  resources :emotions, only: [ :create, :destroy ]
end
