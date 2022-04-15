# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create destroy]
  before_action :correct_user, only: %i[destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to @commentable
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    @comment = @commentable.comments.find(params[:id])
    redirect_to(root_url) unless @comment.user == current_user
  end
end
