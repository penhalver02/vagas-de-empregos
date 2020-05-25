# frozen_string_literal: true

FactoryBot.define do
  factory :job_perfil do
    perfil
    job_opportunity
  end
end
