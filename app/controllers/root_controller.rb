# frozen_string_literal: true

class RootController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @posts = pagy(Post.all)
  end
end
