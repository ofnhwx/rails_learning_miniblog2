# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#index'
  get 'home', to: 'root#home'

  devise_for :users
  resources :users, only: [:show]
  resources :posts, only: [:create]
end
