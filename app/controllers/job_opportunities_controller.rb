class JobOpportunitiesController < ApplicationController
  before_action :authenticate_headhunter_and_user, only: [:show, :index]
  before_action :authenticate_headhunter!, except: [:show, :index]
  before_action :set_job_opportunity, only: [:edit, :update, :destroy, :show]
  
  def index
    @job_opportunities = JobOpportunity.all
  end

  def show
  end

  def new
    @job_opportunity = JobOpportunity.new
    @headhunters = Headhunter.all
  end

  def create
    
    @job_opportunity = JobOpportunity.new(job_opportunity_params.merge(headhunter: current_headhunter))
  
    if @job_opportunity.save
      redirect_to @job_opportunity
    else
      @headhunters = Headhunter.all
      render :new
    end
  end

  def edit
    @headhunters = Headhunter.all
  end

  def update
    if @job_opportunity.update(job_opportunity_params)
      redirect_to @job_opportunity
    else
      @headhunters = Headhunter.all
      render :edit
    end
  end

  def destroy
    @job_opportunity.destroy

    redirect_to job_opportunities_path
  end

  private

  def job_opportunity_params
    params.require(:job_opportunity).permit(:title, :description, :skills, :salary, :job_level, :end_data, :location)
  end

  def set_job_opportunity
    @job_opportunity = JobOpportunity.find(params[:id])
  end

  def authenticate_headhunter_and_user
    authenticate_user! unless(headhunter_signed_in? || user_signed_in?)
  end

end