class JobOpportunity < ApplicationRecord
  belongs_to :headhunter, optional: true
  validates :title, :description, :skills, :salary, :job_level, :end_data, :location, presence: true
  validates :salary, numericality: { greater_than: 0}
end
