class OffersController < ApplicationController
  def new
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @perfil = Perfil.find(params[:perfil_id])
    @offer = Offer.new
  end

  def create
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @offer = Offer.new(offer_params.merge(job_opportunity: @job_opportunity, headhunter: current_headhunter))
    
    if @offer.save
      flash[:notice] = 'Enviado com sucesso'
      redirect_to job_opportunity_job_perfils_path(@job_opportunity)
    else
      @perfil = Perfil.find(offer_params[:perfil_id])
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:begin_date, :salary, :benefit, :role, :perfil_id)
  end
end