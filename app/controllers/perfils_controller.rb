class PerfilsController < ApplicationController
  before_action :set_attributes_for_headhunter, only: :show, if: :headhunter_signed_in?
  
  def show
    @perfil = Perfil.find(params[:id])
    
  end

  def edit
    @perfil = Perfil.find(params[:id])
  end

  def update
    @perfil = Perfil.find(params[:id])
    
    if @perfil.update(perfil_params)
      redirect_to @perfil
    else
      render :edit
    end
  end

  def index
    @perfils = Perfil.all
  end

  private

  def perfil_params
    params.require(:perfil).permit(:full_name, :social_name, :date_birth, :degree, :description, :work_experience,
                                   :avatar)
  end

  def set_attributes_for_headhunter
    @comments = current_headhunter.comments
    @comment = Comment.new(perfil: @perfil)
  end
end