require 'rails_helper'

feature 'User authentication' do
  
  scenario 'login' do
    user = User.create!(email: 'user@test.com.br', password: '12345678')

    visit root_path
    click_on 'Entrar como Usuário'
    fill_in 'Email', with: 'user@test.com.br'
    fill_in 'Senha', with: '12345678'
    within 'form' do
      click_on 'Entrar'
    end
    

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).not_to have_link('Entrar como Usuário')
    expect(page).to have_link('Sair')
  end

  scenario 'logout' do
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).to have_link('Entrar')
  end

  scenario 'sing up' do
    visit root_path
    click_on 'Registrar Usuário'
    fill_in 'Email', with: 'user@test.com.br'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmação de senha', with: '12345678'
    
    click_on 'Cadastrar-se'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar como Usuário')
  end
end