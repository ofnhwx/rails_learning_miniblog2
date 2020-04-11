# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show'
  root 'root#index'

  devise_for :users
  resources :users, only: [:show]
end
