class Offer < ApplicationRecord
  belongs_to :headhunter
  belongs_to :job_opportunity
  belongs_to :perfil
  enum status: {criado: 0, aceito: 1, rejeitado: 2}
end
