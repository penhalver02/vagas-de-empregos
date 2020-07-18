# frozen_string_literal: true

class OffersController < ApplicationController
  def new
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @profile = Profile.find(params[:profile_id])
    @offer = Offer.new
  end

  def create
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @offer = Offer.new(offer_params.merge(job_opportunity: @job_opportunity, headhunter: current_headhunter))

    if @offer.save
      flash[:notice] = 'Enviado com sucesso'
      redirect_to job_opportunity_job_profiles_path(@job_opportunity)
    else
      @profile = Profile.find(offer_params[:profile_id])
      render :new
    end
  end

  def accept
    @offer = Offer.find_by(job_opportunity_id: params[:job_opportunity_id], profile: current_user.profile,
                           id: params[:offer_id])

    @offer.accept
    flash[:notice] = 'Proposta aceita'
    redirect_to current_user.profile
  end

  def review
    @offer = Offer.find_by(job_opportunity_id: params[:job_opportunity_id], profile: current_user.profile,
                           id: params[:offer_id])
  end

  def reject
    @offer = Offer.find_by(job_opportunity_id: params[:job_opportunity_id], profile: current_user.profile,
                           id: params[:offer_id])
    if @offer.update(feedback: offer_params[:feedback], status: :rejeitado)
      flash[:notice] = 'Proposta Rejeitada'
      redirect_to current_user.profile
    else
      render :review
    end
  end

  def index
    @offers = Offer.all
  end

  private

  def offer_params
    params.require(:offer).permit(:begin_date, :salary, :benefit, :role, :profile_id, :feedback)
  end
end
