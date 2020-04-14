# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user

  def show
    @pagy, @posts = pagy(@user.posts)
  end
end
