# frozen_string_literal: true

Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'root#index'
  get 'home', to: 'root#home'

  devise_for :users
  resources :users, only: [:show] do
    member do
      post 'follow', to: 'relationships#create'
      delete 'unfollow', to: 'relationships#destroy'
    end
  end
  resources :posts, only: %i[create destroy] do
    member do
      post 'like', to: 'likes#create'
      delete 'unlike', to: 'likes#destroy'
    end
  end
end
