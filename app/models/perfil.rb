class Perfil < ApplicationRecord
  belongs_to :user

  def completed?
    [full_name,
    social_name,
    date_birth,
    degree,
    description,
    work_experience].map(&:present?).all?
  end
end
