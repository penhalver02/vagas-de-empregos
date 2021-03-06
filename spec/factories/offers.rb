# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    begin_date { '10/03/2090' }
    salary { 4000 }
    benefit { 'Vale refeicao' }
    role { 'Desenvolver projetos de melhoria' }
    headhunter
    job_opportunity
    profile
    status { 0 }
    feedback { 'salario baixo' }
  end
end
