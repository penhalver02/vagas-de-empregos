# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @comment = Comment.new(comments_params.merge(headhunter: current_headhunter, profile: @profile))

    if @comment.save
      redirect_to @profile
    else
      render :new
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:message)
  end
end
