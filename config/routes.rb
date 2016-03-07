Rails.application.routes.draw do
  root 'listings#index'

  resources :users do
    member do
      post 'favourite'
      delete 'unfavourite'
    end
    resources :comments
    resources :favourites, only: [:index]
      collection do
        match 'search'=> 'user#search', via: [:get, :post], as: :search
      end
  end


  resources :listings do
    member do
      post 'favourite'
      delete 'unfavourite'
    end
    resources :comments
    collection do
      match 'search' => 'listings#search', via: [:get, :post], as: :search
    end
  end

  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  resources :conversations do
    resources :messages
  end
end
