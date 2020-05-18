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
    
    @job_opportunity = JobOpportunity.new(job_opportunity_params)
    if @job_opportunity.save
      redirect_to @job_opportunity
    else
      @headhunters = Headhunter.all
      render :new
    end
  end

  def edit
    @job_opportunity = JobOpportunity.find(params[:id])  
    @headhunters = Headhunter.all
  end

  def update
    @job_opportunity = JobOpportunity.find(params[:id])
    
    if @job_opportunity.update(job_opportunity_params)
      redirect_to @job_opportunity
    else
      @headhunters = Headhunter.all
      render :edit
    end
  end

  private

  def job_opportunity_params
    params.require(:job_opportunity).permit(:title, :description, :skills, :salary, :job_level, :end_data, :location, 
                                            :headhunter_id)
  end
end