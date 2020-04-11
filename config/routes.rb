# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#index'
  devise_for :users
end
