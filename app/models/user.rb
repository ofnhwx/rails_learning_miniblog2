# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :username, presence: true

  def like(post)
    liked_posts << post unless like? post
  end

  def unlike(post)
    liked_posts.destroy post
  end

  def like?(post)
    liked_posts.include? post
  end

  def follow(other_user)
    following << other_user unless following? other_user
  end

  def unfollow(other_user)
    following.destroy other_user
  end

  def following?(other_user)
    following.include? other_user
  end
end
