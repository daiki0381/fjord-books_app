# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end