# frozen_string_literal: true

require 'rails_helper'

feature 'User view offer' do
  scenario 'successfuly' do
    user = create(:user)
    profile = create(:profile, user: user)
    offer = create(:offer, begin_date: '10/03/2090', salary: 4000, benefit: 'vale refeicao',
                           role: 'Desenvolver projetos de melhoria', profile: profile)

    login_as user, scope: :user
    visit profile_path(profile)

    expect(page).to have_content('4000')
    expect(page).to have_content('vale refeicao')
    expect(page).to have_content('Desenvolver projetos de melhoria')
    expect(page).to have_link('Aceitar')
    expect(page).to have_link('Rejeitar')
  end
end
