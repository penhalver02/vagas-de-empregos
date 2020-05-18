class JobOpportunitiesController < ApplicationController
  def index
    @job_opportunities = JobOpportunity.all
  end

  def show
    @job_opportunity = JobOpportunity.find(params[:id])
  end

  def new
    @job_opportunity = JobOpportunity.new
    @headhunters = Headhunter.all
  end

  def create
    
    @job_opportunity = JobOpportunity.new(job_params)
    if @job_opportunity.save
      redirect_to @job_opportunity
    else
      @headhunters = Headhunter.all
      render :new
    end
  end

  private

  def job_params
    params.require(:job_opportunity).permit(:title, :description, :skills, :salary, :job_level, :end_data, :location, 
                                            :headhunter_id)
  end
end