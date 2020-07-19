# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'comment cannot be blank' do
    comment = build(:comment, message: '')
    comment.valid?
    expect(comment.errors[:message]).to include('não pode ficar em branco')
  end
end
