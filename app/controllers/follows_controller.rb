# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    following = current_user.active_follows.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referer || root_path
  end

  def destroy
    following = current_user.active_follows.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer || root_path
  end
end
