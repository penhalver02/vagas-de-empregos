# frozen_string_literal: true

require 'rails_helper'

feature 'User reply offer' do
  scenario 'accept succeffuly' do
    user = create(:user)
    offer = create(:offer, begin_date: '10/03/2090', salary: 4000, benefit: 'vale refeicao',
                           role: 'Desenvolver projetos de melhoria', profile: user.profile)

    login_as offer.profile.user, scope: :user
    visit profile_path(offer.profile)
    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita')
    expect(page).to have_content('Oferta aceita')
    expect(page).not_to have_link('Aceitar')
  end

  scenario 'reject reply offer' do
    user = create(:user)
    offer = create(:offer, begin_date: '10/03/2090', salary: 4000, benefit: 'vale refeicao',
                           role: 'Desenvolver projetos de melhoria', profile: user.profile)

    login_as offer.profile.user, scope: :user
    visit profile_path(offer.profile)
    click_on 'Rejeitar'

    fill_in 'Comentario', with: 'Salario baixo'
    click_on 'Enviar'

    expect(page).to have_content('Proposta Rejeitada')
    expect(page).to have_content('Oferta rejeitada')
    expect(page).not_to have_link('Aceitar')
  end
end
