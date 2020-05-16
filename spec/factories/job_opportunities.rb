FactoryBot.define do
  factory :job_opportunity do
    title { "Desenvolvedor Junior" }
    description { "Trabalhar em uma empresa especializada em desenvolvimento de 
      software. Aprendizado em padronização em desenvolvimento. Aprendizado para 
      desenvolver em produtos TOTVS. Aprendizado em processos empresariais. Noção 
      de banco de dados e lógica de programação. Conhecimento em alguma plataforma 
      de desenvolvimento" }
    skills { "Conhecimento em ruby, javascript" }
    salary { 3500 }
    job_level { "Desenvolvedor junior" }
    end_data { 1.day.from_now }
    location { "Avenida Paulista" }
    headhunter
  end
end

