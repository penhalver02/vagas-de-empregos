# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    headhunter { nil }
    profile { nil }
    message { 'MyString' }
  end
end
