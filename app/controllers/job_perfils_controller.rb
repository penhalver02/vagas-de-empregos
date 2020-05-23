class JobPerfilsController < ApplicationController
  def create
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_perfil = JobPerfil.new
    @job_perfil.job_opportunity = @job_opportunity
    @job_perfil.perfil = current_user.perfil
    @job_perfil.save!
    
    redirect_to current_user.perfil
  end
end