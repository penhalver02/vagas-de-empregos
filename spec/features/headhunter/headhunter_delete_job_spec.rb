require 'rails_helper'

feature 'Headhunter delete job' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, headhunter: headhunter)
    

    login_as headhunter, scope: :headhunter
    visit job_opportunity_path(job_opportunity)
    click_on 'Apagar'

    expect(current_path).to eq job_opportunities_path
    expect(page).to have_content('Nenhuma vaga criada')
  end

  scenario 'and keep anothers' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, title: 'Administrador no Bradesco', headhunter: headhunter)
    another_job_opportunity = create(:job_opportunity, title: 'Banco SSA', headhunter: headhunter)
    

    login_as headhunter, scope: :headhunter
    visit job_opportunity_path(job_opportunity)
    click_on 'Apagar'

    expect(current_path).to eq job_opportunities_path
    expect(page).to have_content('Banco SSA')
    expect(page).not_to have_content('Administrador no Bradesco')
  end
end