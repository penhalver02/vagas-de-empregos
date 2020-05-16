class JobOpportunitiesController < ApplicationController
  def index
    @jobs = JobOpportunity.all
  end

  def show
    @job = JobOpportunity.find(params[:id])
  end
end