# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'allasset_history', to: 'asset_history#index'
  get 'asset_history/:id', to: 'asset_history#show'
  post 'return_asset/:id', to: 'asset_history#return_asset'
  get 'return_asset/:id', to: 'asset_history#return_asset'
  get 'myhistory', to: 'asset_history#myhistory'
  post 'issue_asset', to: 'asset_history#issue_asset'
  namespace :users do
    resources :users
  end
  resources :assets, only: %i[create index update show]
end
