require 'rails_helper'

feature 'User enroll job' do
  scenario 'successfully'do
    job_opportunity = create(:job_opportunity)
    user = create(:user, email: 'lucas@test.com.br')

    login_as user, scope: :user
    visit root_path
    click_on 'Vagas'
    click_on 'Desenvolvedor Junior'
    click_on 'Inscrever'

    expect(page).to have_content('Inscrito')
  end
end