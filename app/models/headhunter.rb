class Headhunter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :job_opportunities
  has_many :comments
  has_many :favorites

  def is_job_seeker_favorite?(perfil)
    favorites.find_by(perfil_id: perfil.id).present?
  end
end
