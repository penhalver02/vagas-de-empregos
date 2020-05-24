require 'rails_helper'

feature 'headhunter view user' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Junior', headhunter: headhunter)
    perfil = create(:perfil, full_name: 'Lucas Penhalver')
    another_perfil = create(:perfil, full_name: 'Marcio Alves')
    job_perfil = create(:job_perfil, perfil: perfil, job_opportunity: job_opportunity)
    job_perfil = create(:job_perfil, perfil: another_perfil, job_opportunity: job_opportunity)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Desenvolvedor Junior'
    click_on 'Candidatos da Vaga'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Marcio Alves')
  end
end