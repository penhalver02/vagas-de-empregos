# frozen_string_literal: true

FactoryBot.define do
  factory :job_profile do
    profile
    job_opportunity
  end
end
