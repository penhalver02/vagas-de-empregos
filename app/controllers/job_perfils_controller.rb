class JobPerfilsController < ApplicationController
  def create
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_perfil = JobPerfil.new
    @job_perfil.job_opportunity = @job_opportunity
    @job_perfil.perfil = current_user.perfil
    @job_perfil.save!
    
    redirect_to current_user.perfil
  end

  def index
    @job_opportunity = JobOpportunity.find_by(id: params[:job_opportunity_id], headhunter: current_headhunter)
    @job_perfils = @job_opportunity.job_perfils
  end

  def edit
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_perfil = JobPerfil.find(params[:id])
  end

  def update
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_perfil = JobPerfil.find(params[:id])
    if @job_perfil.update(params.require(:job_perfil).permit(:feedback).merge(rejected: true))
      redirect_to @job_perfil.perfil
    else
      render :edit
    end
  end
end