# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    full_name { 'Lucas Penhalver' }
    social_name { 'Lucas Penhalver' }
    date_birth { '11/11/1989' }
    degree { 'Engenharia de produção' }
    description { 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização' }
    work_experience { 'De 3 a 5 anos' }
    user
  end
end
