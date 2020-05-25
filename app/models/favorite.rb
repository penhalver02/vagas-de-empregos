# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :headhunter
  belongs_to :perfil
end
