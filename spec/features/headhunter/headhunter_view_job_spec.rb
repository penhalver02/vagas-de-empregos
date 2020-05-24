require 'rails_helper'

feature 'Headhunter view jobs' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job_opportunity = JobOpportunity.create!(title: 'Desenvolvedor Junior', 
                                            description: 'Trabalhar em uma empresa especializada em desenvolvimento de 
                                            software. Aprendizado em padronização em desenvolvimento. Aprendizado para 
                                            desenvolver em produtos TOTVS. Aprendizado em processos empresariais. Noção 
                                            de banco de dados e lógica de programação. Conhecimento em alguma plataforma 
                                            de desenvolvimento.', skills: 'Conhecimento em ruby, javascript', 
                                            salary: 3500, job_level: 'Desenvolvedor junior', end_data: 1.day.from_now,
                                            location: 'Avenida Paulista', headhunter: headhunter)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Vagas'

    expect(page).to have_content('Vagas')
    expect(page).to have_content('Desenvolvedor Junior')
    expect(page).to have_content('Trabalhar em uma empresa especializada em desenvolvimento')
  end

  scenario 'and view details' do
    headhunter = create(:headhunter)
    job_opportunity = JobOpportunity.create!(title: 'Desenvolvedor Junior', 
      description: 'Trabalhar em uma empresa especializada em desenvolvimento de 
      software. Aprendizado em padronização em desenvolvimento. Aprendizado para 
      desenvolver em produtos TOTVS. Aprendizado em processos empresariais. Noção 
      de banco de dados e lógica de programação. Conhecimento em alguma plataforma 
      de desenvolvimento.', skills: 'Conhecimento em ruby, javascript', 
      salary: 3500, job_level: 'Desenvolvedor junior', end_data: 1.day.from_now,
      location: 'Avenida Paulista', headhunter: headhunter)

      login_as headhunter, scope: :headhunter
      visit job_opportunities_path
      click_on 'Desenvolvedor Junior'

      expect(page).to have_content('Desenvolvedor Junior')
      expect(page).to have_content('Trabalhar em uma empresa especializada em desenvolvimento de')
      expect(page).to have_content('Conhecimento em ruby, javascript')
      expect(page).to have_content('Salário: 3500')
      expect(page).to have_content('Desenvolvedor junior')
      expect(page).to have_content(I18n.l(job_opportunity.end_data))
      expect(page).to have_content('Localização: Avenida Paulista')
      expect(page).to have_content(headhunter.email)
  end

  scenario 'and no jobs created' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter
    visit job_opportunities_path

    expect(page).to have_content('Nenhuma vaga criada')
  end

  scenario 'and return to index' do
    headhunter = create(:headhunter)
    job_opportunity = create(:job_opportunity, headhunter: headhunter)
    
    login_as headhunter, scope: :headhunter
    visit job_opportunity_path(job_opportunity)
    click_on 'Voltar'

    expect(current_path).to eq(job_opportunities_path)
  end

  scenario 'cannot view unless logged in' do
    job_opportunity = create(:job_opportunity)

    visit job_opportunity_path(job_opportunity)

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'view your job' do
    headhunter = create(:headhunter)
    job_opportunity = JobOpportunity.create!(title: 'Desenvolvedor Junior', 
                                            description: 'Trabalhar em uma empresa especializada em desenvolvimento',
                                            skills: 'Conhecimento em ruby, javascript',
                                            salary: 3500, job_level: 'Desenvolvedor junior', end_data: 1.day.from_now,
                                            location: 'Avenida Paulista', headhunter: headhunter)
    another_head_hunter = create(:headhunter)
    another_job_opportunity = JobOpportunity.create!(title: 'Administração de empresas', 
                                                    description: 'Atuar na aera financeira', 
                                                    skills: 'Conhecimento em ruby, javascript', 
                                                    salary: 3500, job_level: 'Desenvolvedor junior', 
                                                    end_data: 1.day.from_now,
                                                    location: 'Avenida Paulista', headhunter: another_head_hunter)

    login_as headhunter, scope: :headhunter
    visit root_path
    click_on 'Minhas Vagas'

    expect(page).to have_content('Vagas')
    expect(page).to have_content('Desenvolvedor Junior')
    expect(page).to have_content('Trabalhar em uma empresa especializada em desenvolvimento')
    expect(page).not_to have_content('Administração de empresas')
    expect(page).not_to have_content('Atuar na aera financeira')
  end
  
  scenario 'and view details' do
    headhunter = create(:headhunter)
    job_opportunity = JobOpportunity.create!(title: 'Desenvolvedor Junior', 
      description: 'Trabalhar em uma empresa especializada em desenvolvimento de 
      software. Aprendizado em padronização em desenvolvimento. Aprendizado para 
      desenvolver em produtos TOTVS. Aprendizado em processos empresariais. Noção 
      de banco de dados e lógica de programação. Conhecimento em alguma plataforma 
      de desenvolvimento.', skills: 'Conhecimento em ruby, javascript', 
      salary: 3500, job_level: 'Desenvolvedor junior', end_data: 1.day.from_now,
      location: 'Avenida Paulista', headhunter: headhunter)

      login_as headhunter, scope: :headhunter
      visit root_path
      click_on 'Minhas Vagas'
      click_on 'Desenvolvedor Junior'

      expect(page).to have_content('Desenvolvedor Junior')
      expect(page).to have_content('Trabalhar em uma empresa especializada em desenvolvimento de')
      expect(page).to have_content('Conhecimento em ruby, javascript')
      expect(page).to have_content('Salário: 3500')
      expect(page).to have_content('Desenvolvedor junior')
      expect(page).to have_content(I18n.l(job_opportunity.end_data))
      expect(page).to have_content('Localização: Avenida Paulista')
      expect(page).to have_content(headhunter.email)
  end
end