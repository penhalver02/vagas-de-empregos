# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :headhunter
  belongs_to :job_opportunity
  belongs_to :profile
  enum status: { criado: 0, aceito: 1, rejeitado: 2 }

  def accept
    transaction do
      Offer
        .where(profile: profile)
        .where(status: :criado)
        .update(status: :rejeitado)

      update(status: :aceito)
    end
  end
end
