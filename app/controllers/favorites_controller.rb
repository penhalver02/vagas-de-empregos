# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    profile = Profile.find(params[:profile_id])
    Favorite.new(profile: profile, headhunter: current_headhunter).save
    redirect_to profile
  end

  def destroy
    profile = Profile.find(params[:profile_id])
    @favorite = Favorite.find(profile: profile, headhunter: current_headhunter)
    @favorite.destroy
    redirect_to profile
  end
end
