# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com.br" }
    password { '12345678' }
  end
end
