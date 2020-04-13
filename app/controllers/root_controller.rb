# frozen_string_literal: true

class RootController < ApplicationController
  before_action :redirect_to_root, only: %i[home]
  before_action :redirect_to_home, only: %i[index]

  def index
    @pagy, @posts = pagy(Post.all)
  end

  def home
    @pagy, @posts = pagy(Post.all)
    @post = current_user.posts.build
  end

  private

  def redirect_to_root
    redirect_to root_path unless user_signed_in?
  end

  def redirect_to_home
    redirect_to home_path if user_signed_in?
  end
end
