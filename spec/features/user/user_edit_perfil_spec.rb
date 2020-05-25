# frozen_string_literal: true

require 'rails_helper'

feature 'User edit perfil' do
  scenario 'successfully' do
    user = create(:user)

    login_as user, scope: :user
    visit edit_perfil_path(user.perfil)

    fill_in 'Nome Completo', with: 'Lucas Penhalver'
    fill_in 'Nome Social', with: 'Lucas Penhalver'
    fill_in 'Data de aniversário', with: '11/11/1989'
    fill_in 'Formação', with: 'Engenharia de produção'
    fill_in 'Descrição', with: 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização'
    fill_in 'Experiência', with: 'De 3 a 5 anos'
    click_on 'Salvar'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content(I18n.l(Date.parse('11/11/1989')))
    expect(page).to have_content('Engenharia de produção')
    expect(page).to have_content('Diariamente acompanha o sistema produtivo da empresa visando sua otimização')
    expect(page).to have_content('De 3 a 5 anos')
  end
end
