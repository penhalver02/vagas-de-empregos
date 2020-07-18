# frozen_string_literal: true

require 'rails_helper'

feature 'headhunter view user' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Junior', headhunter: headhunter)
    profile = create(:profile, full_name: 'Lucas Penhalver')
    another_profile = create(:profile, full_name: 'Marcio Alves')
    job_profile = create(:job_profile, profile: profile, job_opportunity: job_opportunity)
    job_profile = create(:job_profile, profile: another_profile, job_opportunity: job_opportunity)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Desenvolvedor Junior'
    click_on 'Candidatos da Vaga'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Marcio Alves')
  end

  scenario 'job is empyt' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Junior', headhunter: headhunter)
    

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Desenvolvedor Junior'
    click_on 'Candidatos da Vaga'

    expect(page).to have_content('Nenhum candidato aplicado')
  end
end
