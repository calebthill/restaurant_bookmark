Rails.application.routes.draw do
  devise_for :users
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:index, :show]
  resources :favorite_restaurants, only: [:index, :new, :create, :show, :destroy]
  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create, :show ]
  end
  # Namespace for API
  namespace :api do
    resources :users, only: [:index, :create, :new, :show]
  end

  root 'pages#home'

  get "/search" => 'restaurants#search'

  get "/chart" => 'favorite_restaurants#chart'

  get "/followers" => 'users#followers'
end
