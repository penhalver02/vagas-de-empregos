# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_many :job_profiles
  has_many :job_opportunities, through: :job_profiles
  has_many :comments
  has_many :favorites
  has_many :offers
  has_one_attached :avatar

  def completed?
    [full_name,
     social_name,
     date_birth,
     degree,
     description,
     work_experience].map(&:present?).all?
  end
end
