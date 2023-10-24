# frozen_string_literal: true

Rails.application.routes.draw do
    devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'asset_history', to: 'assets_history#index'
  get 'asset_history/:id', to: 'assets_history#show'
  post 'return_asset/:id', to: 'assets_history#return_asset'
  get 'return_asset/:id', to: 'assets_history#return_asset'

  post 'issue_asset', to: 'assets_history#issue_asset'
  resources :employee
  resources :assets, only: %i[create index update show]
end
