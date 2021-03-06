# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter leave a comment' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    user = create(:user, email: 'lucas@test.com.br')
    profile = create(:profile, full_name: 'Lucas Penhalver')

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'
    click_on 'Comentar'

    fill_in 'Mensagem', with: 'Otimo candidato para areas de humas, muito experiente'
    click_on 'Enviar'

    expect(page).to have_content('Otimo candidato para areas de humas, muito experiente')
  end

  scenario 'cannot be blank' do
    headhunter = create(:headhunter)
    user = create(:user, email: 'lucas@test.com.br')
    profile = create(:profile, full_name: 'Lucas Penhalver')

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'
    click_on 'Comentar'

    fill_in 'Mensagem', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Mensagem não pode ficar em branco')
  end
  
  scenario 'just headhunter can see' do
    headhunter = create(:headhunter)
    user = create(:user, email: 'lucas@test.com.br')
    profile = create(:profile, full_name: 'Lucas Penhalver')

    login_as user, scope: :user
    
    visit root_path
    click_on 'lucas@test.com.br'
    
    expect(page).not_to have_link('Comentar')
  end
end
