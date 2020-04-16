# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'test' }
    email { 'test@example.com' }
    password { 'password' }
  end
end
