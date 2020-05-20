class PerfilsController < ApplicationController
  def show
    @perfil = Perfil.find(params[:id])
  end

  def new
    @perfil = Perfil.new
  end

  def create
    @perfil = Perfil.new(perfil_params.merge(user: current_user))
    
    if @perfil.save
      redirect_to @perfil
    else
      render :new
    end
  end

  private

  def perfil_params
    params.require(:perfil).permit(:full_name, :social_name, :date_birth, :degree, :description, :work_experience)
  end
end