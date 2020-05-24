FactoryBot.define do
  factory :offer do
    begin_date { "2020-05-24" }
    salary { 1.5 }
    benefit { "MyString" }
    role { "MyString" }
    headhunter { nil }
    job_opportunity { nil }
    perfil { nil }
    status { "" }
  end
end
