# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter view user feedback' do
  scenario 'successfully' do
    offer = create(:offer, begin_date: '10/03/2090', salary: 4000, benefit: 'vale refeicao',
                           role: 'Desenvolver projetos de melhoria', status: :rejeitado, feedback: 'salario baixo')

    login_as offer.headhunter, scope: :headhunter
    visit root_path
    click_on 'Propostas'

    expect(page).to have_content('salario baixo')
  end
end
