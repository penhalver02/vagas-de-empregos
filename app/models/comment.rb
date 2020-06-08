# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :headhunter
  belongs_to :perfil
  validates :message, presence: true
end
