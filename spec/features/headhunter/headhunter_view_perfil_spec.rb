# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter view perfil' do
  scenario 'successfuly' do
    headhunter = create(:headhunter)
    perfil = create(:perfil, full_name: 'Lucas Penhalver')
    perfil = create(:perfil, full_name: 'Marcos Alves')

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'

    expect(page).to have_content('Lucas Penhalver')
    expect(page) .to have_content('Marcos Alves')
  end

  scenario 'no perfils are created' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'

    expect(page).to have_content('Nenhum candidato cadastrado')
  end

  scenario 'view perfil details' do
    headhunter = create(:headhunter)
    user = create(:user)
    perfil = Perfil.create!(full_name: 'Lucas Penhalver', social_name: 'Lucas Penhalver', date_birth: '11/11/1989',
                            degree: 'Engenharia de produção',
                            description: 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização',
                            work_experience: 'De 3 a 5 anos', user: user)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content(I18n.l(perfil.date_birth))
    expect(page).to have_content('Engenharia de produção')
    expect(page).to have_content('Diariamente acompanha o sistema produtivo da empresa visando sua otimização')
    expect(page).to have_content('De 3 a 5 anos')
  end
end
