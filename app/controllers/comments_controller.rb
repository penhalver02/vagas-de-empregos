class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @perfil = Perfil.find(params[:perfil_id])
  end

  def create
    @perfil = Perfil.find(params[:perfil_id])
    @comment = Comment.new(comments_params.merge(headhunter: current_headhunter, perfil: @perfil))

    if @comment.save
      redirect_to @perfil
    else
      render :new
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:message)
  end
end