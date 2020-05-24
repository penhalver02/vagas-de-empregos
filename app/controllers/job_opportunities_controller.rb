class JobOpportunitiesController < ApplicationController
  before_action :authenticate_headhunter_and_user, only: [:show, :index]
  before_action :authenticate_headhunter!, except: [:show, :index]
  before_action :set_job_opportunity, only: [:edit, :update, :destroy, :show, :close]
  
  def headhunter
    @job_opportunities = current_headhunter.job_opportunities
    render :index
  end

  def index
    @job_opportunities = JobOpportunity.all
  end

  def show
  end

  def new
    @job_opportunity = JobOpportunity.new
    
  end

  def create
    
    @job_opportunity = JobOpportunity.new(job_opportunity_params.merge(headhunter: current_headhunter))
  
    if @job_opportunity.save
      redirect_to @job_opportunity
    else
     
      render :new
    end
  end

  def edit
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
  
  def close
    @job_opportunity.update(closed: true)
    flash[:notice] = 'Vaga fechada'
    redirect_to @job_opportunity
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