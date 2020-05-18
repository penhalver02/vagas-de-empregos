class JobOpportunity < ApplicationRecord
  belongs_to :headhunter
  validates :title, :description, :skills, :salary, :job_level, :end_data, :location, :headhunter, presence: true
  validates :salary, numericality: { greater_than: 0}
end
