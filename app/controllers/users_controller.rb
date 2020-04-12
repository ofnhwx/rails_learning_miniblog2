# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user

  include Pagy::Backend

  def show
    @pagy, @posts = pagy(@user.posts)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
