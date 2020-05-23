require 'rails_helper'

feature 'Headhunter add user to favorite' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    perf = create(:perfil, full_name: 'Lucas Penhalver')

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'
    click_on 'Favorito'

    expect(page).to have_css('span#favorite')
  end

  scenario 'another headhunter cant view' do
    headhunter = create(:headhunter)
    perfil = create(:perfil, full_name: 'Lucas Penhalver')
    favorite = create(:favorite, perfil: perfil)
   
    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'
    

    expect(page).not_to have_css('span#favorite')
  end
end