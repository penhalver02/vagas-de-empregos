require 'rails_helper'

feature 'User create perfil' do
  scenario 'successfully' do
    user = create(:user)

    login_as user, scope: :user
    visit new_perfil_path

    erfil = Perfil.create!(full_name: 'Lucas Penhalver', social_name: 'Lucas Penhalver', date_birth: '11/11/1989',
                          degree: 'Engenharia de produção',
                          description: 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização',
                          work_experience: 'De 3 a 5 anos', user: user)
    fill_in 'Nome Completo', with: 'Lucas Penhalver'
    fill_in 'Nome Social', with: 'Lucas Penhalver'
    fill_in 'Data de aniversário', with: '11/11/1989'
    fill_in 'Formação', with: 'Engenharia de produção'
    fill_in 'Descrição', with: 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização'
    fill_in 'Experiência', with: 'De 3 a 5 anos'
    click_on 'Salvar'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content(I18n.l(Date.parse '11/11/1989'))
    expect(page).to have_content('Engenharia de produção')
    expect(page).to have_content('Diariamente acompanha o sistema produtivo da empresa visando sua otimização')
    expect(page).to have_content('De 3 a 5 anos')
  end
end