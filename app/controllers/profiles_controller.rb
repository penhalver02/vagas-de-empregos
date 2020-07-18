# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :find_profile, only: %i[show update edit]
  before_action :set_attributes_for_headhunter, only: :show, if: :headhunter_signed_in?

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def index
    @profiles = Profile.all
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :social_name, :date_birth, :degree, :description, :work_experience,
                                   :avatar)
  end

  def set_attributes_for_headhunter
    @comments = current_headhunter.comments
    @comment = Comment.new(profile: @profile)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
