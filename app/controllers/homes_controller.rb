# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = current_user
  end
end