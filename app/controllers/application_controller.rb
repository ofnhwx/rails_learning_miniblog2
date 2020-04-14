# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  private

  def set_user
    @user = User.find(params[:id])
  end
end
