# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :authenticate_user!
  def create
    following = current_user.active_friends.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referer || root_path
  end

  def destroy
    following = current_user.active_friends.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer || root_path
  end
end
