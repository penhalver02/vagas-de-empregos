# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :headhunter
  belongs_to :profile
  validates :message, presence: true
end
