# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || after_sign_in_path
  end

  private

  def after_sign_in_path
    return edit_profile_path(current_user.profile) if edit_user_profile?

    job_opportunities_path
  end

  def edit_user_profile?
    current_user.present? && !current_user.profile.completed?
  end
end
