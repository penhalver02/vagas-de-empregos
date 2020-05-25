# frozen_string_literal: true

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

  def accept
    @offer = Offer.find_by(job_opportunity_id: params[:job_opportunity_id], perfil: current_user.perfil,
                           id: params[:offer_id])

    @offer.accept
    flash[:notice] = 'Proposta aceita'
    redirect_to current_user.perfil
  end

  def review
    @offer = Offer.find_by(job_opportunity_id: params[:job_opportunity_id], perfil: current_user.perfil,
                           id: params[:offer_id])
  end

  def reject
    @offer = Offer.find_by(job_opportunity_id: params[:job_opportunity_id], perfil: current_user.perfil,
                           id: params[:offer_id])
    if @offer.update(feedback: offer_params[:feedback], status: :rejeitado)
      flash[:notice] = 'Proposta Rejeitada'
      redirect_to current_user.perfil
    else
      render :review
    end
  end

  def index
    @offers = Offer.all
  end

  private

  def offer_params
    params.require(:offer).permit(:begin_date, :salary, :benefit, :role, :perfil_id, :feedback)
  end
end
