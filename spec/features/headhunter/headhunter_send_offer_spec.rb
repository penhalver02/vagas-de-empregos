# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter send offer' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, headhunter: headhunter, title: 'Desenvolvedor Junior')
    perfil = create(:perfil)
    job_perfil = create(:job_perfil, job_opportunity: job_opportunity)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Desenvolvedor Junior'
    click_on 'Candidatos da Vaga'
    click_on 'Enviar proposta'

    fill_in 'Data de inicio', with: '01/10/2090'
    fill_in 'Salário', with: '4000'
    fill_in 'Benefícios', with: 'Vale refeicao'
    fill_in 'Cargo', with: 'Desenvolver projetos de melhoria'
    click_on 'Enviar'

    expect(page).to have_content('Enviado com sucesso')
  end
end
