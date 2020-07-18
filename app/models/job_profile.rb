# frozen_string_literal: true

class JobProfile < ApplicationRecord
  belongs_to :profile
  belongs_to :job_opportunity
end
