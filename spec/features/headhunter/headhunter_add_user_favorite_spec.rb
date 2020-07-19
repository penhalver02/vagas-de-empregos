# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter add user to favorite' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    perf = create(:profile, full_name: 'Lucas Penhalver')

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'
    click_on 'Favorito'

    expect(page).to have_css('span#favorite')
  end

  scenario 'another headhunter cant view' do
    headhunter = create(:headhunter)
    profile = create(:profile, full_name: 'Lucas Penhalver')
    favorite = create(:favorite, profile: profile)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Candidatos'
    click_on 'Lucas Penhalver'

    expect(page).not_to have_css('span#favorite')
  end

  scenario 'user cant view' do
    user = create(:user, email: 'lucas@test.com')

    login_as user, scope: :user
    visit root_path
    click_on 'lucas@test.com'

    expect(page).not_to have_css('span#favorite')
  end
end
