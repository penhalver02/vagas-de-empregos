# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter register jo' do
  scenario 'successfully' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Vagas'
    click_on 'Cadastrar vaga'

    fill_in 'Título', with: 'Desenvolvedor Junior'
    fill_in 'Descrição', with: 'Trabalhar em uma empresa especializada em desenvolvimento de software'
    fill_in 'Habilidades', with: 'Conhecimento em ruby, javascript'
    fill_in 'Salário', with: '3500'
    fill_in 'Cargo', with: 'Desenvolvedor junior'
    fill_in 'Data final', with:  '20/08/2090'
    fill_in 'Localização', with: 'Avenida Paulista'

    click_on 'Enviar'

    expect(page).to have_content('Desenvolvedor Junior')
    expect(page).to have_content('Trabalhar em uma empresa especializada em desenvolvimento de')
    expect(page).to have_content('Conhecimento em ruby, javascript')
    expect(page).to have_content('Salário: 3500')
    expect(page).to have_content('Desenvolvedor junior')
    expect(page).to have_content '20/08/2090'
    expect(page).to have_content('Localização: Avenida Paulista')
    expect(page).to have_content(headhunter.email)
  end

  scenario 'must fill in all' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter
    visit new_job_opportunity_path
    click_on 'Enviar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Habilidades não pode ficar em branco')
    expect(page).to have_content('Salário não pode ficar em branco')
    expect(page).to have_content('Cargo não pode ficar em branco')
    expect(page).to have_content('Data final não pode ficar em branco')
    expect(page).to have_content('Localização não pode ficar em branco')
  end

  scenario 'and must be authenticated' do
    visit new_job_opportunity_path

    expect(current_path).to eq(new_headhunter_session_path)
  end
end
