# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    headhunter { nil }
    perfil { nil }
    message { 'MyString' }
  end
end
