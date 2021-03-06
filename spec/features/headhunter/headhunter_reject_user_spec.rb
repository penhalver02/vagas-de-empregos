# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter reject user' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Junior', headhunter: headhunter)
    profile = create(:profile, full_name: 'Lucas Penhalver')
    job_profile = create(:job_profile, profile: profile, job_opportunity: job_opportunity)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Desenvolvedor Junior'
    click_on 'Candidatos da Vaga'
    click_on 'Rejeitar'

    fill_in 'Comentario', with: 'Procuramos pessoal com mais experiencia'
    click_on 'Enviar'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Procuramos pessoal com mais experiencia')
  end

end
