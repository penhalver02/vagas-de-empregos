# frozen_string_literal: true

class JobOpportunity < ApplicationRecord
  belongs_to :headhunter
  has_many :job_perfils
  has_one :offer
  has_many :perfils, through: :job_perfils
  validates :title, :description, :skills, :salary, :job_level, :end_data, :location, presence: true
  validates :salary, numericality: { greater_than: 0 }
end
