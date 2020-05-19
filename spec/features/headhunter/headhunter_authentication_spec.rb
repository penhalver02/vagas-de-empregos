require 'rails_helper'

feature 'Headhunter authentication' do
  scenario 'login' do
    headhunter = Headhunter.create!(email: 'test@test.com.br', password: '12345678')

    visit root_path
    click_on 'Entrar como Recrutador'
    fill_in 'Email', with: 'test@test.com.br'
    fill_in 'Senha', with: '12345678'
    within 'form' do
      click_on 'Entrar'
    end
    

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).not_to have_link('Entrar como Recrutador')
    expect(page).to have_link('Sair')
  end

  scenario 'logout' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).to have_link('Entrar')
  end

  scenario 'sing up' do
    visit root_path
    click_on 'Registrar Recrutador'
    fill_in 'Email', with: 'test@test.com.br'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmação de senha', with: '12345678'
    click_on 'Cadastrar-se'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar como Recrutador')
  end

  xscenario 'and must fill in all fields' do
    visit new_headhunter_session_path
    within 'form' do
      click_on 'Entrar'
    end
    
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
  end
end