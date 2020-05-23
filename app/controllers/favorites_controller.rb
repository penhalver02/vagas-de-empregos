class FavoritesController < ApplicationController
  def create
    perfil = Perfil.find(params[:perfil_id])
    Favorite.new(perfil: perfil, headhunter: current_headhunter).save
    redirect_to perfil
      
  end
  def destroy
    perfil = Perfil.find(params[:perfil_id])
    @favorite = Favorite.find(perfil: perfil, headhunter: current_headhunter)
    @favorite.destroy
    redirect_to perfil
  end
end