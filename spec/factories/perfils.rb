FactoryBot.define do
  factory :perfil do
    full_name { "MyString" }
    social_name { "MyString" }
    date_birth { "2020-05-20" }
    degree { "MyString" }
    description { "MyString" }
    work_experience { "MyString" }
    user { nil }
  end
end
