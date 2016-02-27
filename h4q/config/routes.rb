Rails.application.routes.draw do
  root 'listings#index'
  resources :users
  resources :listings


end
