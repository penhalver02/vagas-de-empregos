require 'rails_helper'

feature 'Vistor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_link('Registrar-se')
    expect(page).to have_link('Registrar recrutador')
    expect(page).to have_link('Entrar')
    expect(page).to have_link('Vagas')
  end
end