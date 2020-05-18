require 'rails_helper'

feature 'Headhunter edit job' do
  scenario 'successfully' do
    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Junior')

    visit job_opportunity_path(job_opportunity)
    click_on 'Editar'

    fill_in 'Título', with: 'Desenvolvedor sênior'
    click_on 'Enviar'

    expect(page).to have_content('Desenvolvedor sênior')
  end

  scenario 'successfully' do
    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Junior')

    visit job_opportunity_path(job_opportunity)
    click_on 'Editar'

    fill_in 'Título', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Título não pode ficar em branco')
  end
end