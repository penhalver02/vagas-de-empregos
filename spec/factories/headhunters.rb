FactoryBot.define do
  factory :headhunter do
    sequence(:email) { |n| "test#{n}@test.com.br" }
    password { '12345678'}
  end
end
