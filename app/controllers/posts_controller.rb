# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  include Pagy::Backend

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to home_path, notice: '投稿しました'
    else
      @pagy, @posts = pagy(Post.all)
      render 'root/home'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
