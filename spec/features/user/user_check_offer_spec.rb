require 'rails_helper'

feature 'User view offer' do
  scenario 'successfuly' do
    user = create(:user)
    perfil = create(:perfil, user: user)
    offer = create(:offer, begin_date: '10/03/2090', salary: 4000, benefit: 'vale refeicao', 
                  role: 'Desenvolver projetos de melhoria', perfil: perfil)

    login_as user, scope: :user
    visit perfil_path(perfil)

    expect(page).to have_content('4000')
    expect(page).to have_content('vale refeicao')
    expect(page).to have_content('Desenvolver projetos de melhoria')
    expect(page).to have_link('Aceitar')
    expect(page).to have_link('Rejeitar')

  end
end