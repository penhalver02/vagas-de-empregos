require 'rails_helper'

feature 'User view perfil' do
  scenario 'successfully' do
    user = create(:user, email: 'lucas@test.com.br')
    perfil = Perfil.create!(full_name: 'Lucas Penhalver', social_name: 'Lucas Penhalver', date_birth: '11/11/1989',
                            degree: 'Engenharia de produção',
                            description: 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização',
                            work_experience: 'De 3 a 5 anos', user: user)

    login_as user, scope: :user
    visit root_path
    click_on 'lucas@test.com.br'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content(I18n.l(perfil.date_birth))
    expect(page).to have_content('Engenharia de produção')
    expect(page).to have_content('Diariamente acompanha o sistema produtivo da empresa visando sua otimização')
    expect(page).to have_content('De 3 a 5 anos')
  end

  xscenario 'cannot view unless logged in' do
    perfil = create(:perfil)

    visit perfil_path(perfil)

    expect(current_path).to eq(new_user_session_path)
  end
end