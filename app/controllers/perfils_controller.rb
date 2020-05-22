class PerfilsController < ApplicationController
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

  private

  def perfil_params
    params.require(:perfil).permit(:full_name, :social_name, :date_birth, :degree, :description, :work_experience,
                                   :avatar)
  end
end