# frozen_string_literal: true

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

  scenario 'user does not see' do
    job_opportunity = create(:job_opportunity, title: 'Vaga fechada', closed: true)
    user = create(:user)

    login_as user, scope: :user
    visit job_opportunities_path

    expect(page).not_to have_content('Vaga fechada')
  end

  scenario 'must be loggin' do
    job_opportunity = create(:job_opportunity)

    visit job_opportunity_path(job_opportunity)

    expect(current_path).to eq(new_user_session_path)
  end
end
