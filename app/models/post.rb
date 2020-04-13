# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_by, through: :likes, source: :user

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 140 }
end
