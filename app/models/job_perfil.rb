class JobPerfil < ApplicationRecord
  belongs_to :perfil
  belongs_to :job_opportunity
end