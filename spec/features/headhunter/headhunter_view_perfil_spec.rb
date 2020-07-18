# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter view profile' do
  scenario 'successfuly' do
    headhunter = create(:headhunter)
    profile = create(:profile, full_name: 'Lucas Penhalver')
    profile = create(:profile, full_name: 'Marcos Alves')

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'

    expect(page).to have_content('Lucas Penhalver')
    expect(page) .to have_content('Marcos Alves')
  end

  scenario 'no profiles are created' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'

    expect(page).to have_content('Nenhum candidato cadastrado')
  end

  scenario 'view profile details' do
    headhunter = create(:headhunter)
    user = create(:user)
    profile = Profile.create!(full_name: 'Lucas Penhalver', social_name: 'Lucas Penhalver', date_birth: '11/11/1989',
                            degree: 'Engenharia de produção',
                            description: 'Diariamente acompanha o sistema produtivo da empresa visando sua otimização',
                            work_experience: 'De 3 a 5 anos', user: user)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'

    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content('Lucas Penhalver')
    expect(page).to have_content(I18n.l(profile.date_birth))
    expect(page).to have_content('Engenharia de produção')
    expect(page).to have_content('Diariamente acompanha o sistema produtivo da empresa visando sua otimização')
    expect(page).to have_content('De 3 a 5 anos')
  end
end
