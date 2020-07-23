# frozen_string_literal: true

class JobProfilesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]
  before_action :authenticate_headhunter!, only: [ :index, :edit, :reject ]
  def create
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_profile = JobProfile.new
    @job_profile.job_opportunity = @job_opportunity
    @job_profile.profile = current_user.profile
    @job_profile.save!

    redirect_to current_user.profile
  end

  def index
    @job_opportunity = JobOpportunity.find_by(id: params[:job_opportunity_id], headhunter: current_headhunter)
    @job_profiles = @job_opportunity.job_profiles
  end

  def edit
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_profile = JobProfile.find(params[:id])
  end

  def reject
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @job_profile = JobProfile.find(params[:job_profile_id])
    if @job_profile.update(params.require(:job_profile).permit(:feedback).merge(rejected: true))
      redirect_to @job_profile.profile
    else
      render :edit
    end
  end
end
