require 'rails_helper'

feature 'Headhunter closed job' do
  scenario 'successfully' do
    job_opportunity = create(:job_opportunity)
    
    login_as job_opportunity.headhunter, scope: :headhunter
    visit job_opportunity_path(job_opportunity)
    click_on 'Fechar'

    expect(page).to have_content('Vaga fechada')
    expect(page).not_to have_link('Editar')
  end
end