# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  it 'begin_date cannot be blank' do
    offer = build(:offer, begin_date: '')
    offer.valid?
    expect(offer.errors[:begin_date]).to include('não pode ficar em branco')
  end

  it 'salary cannot be blank' do
    offer = build(:offer, salary: '')
    offer.valid?
    expect(offer.errors[:salary]).to include('não pode ficar em branco')
  end

  it 'benefit cannot be blank' do
    offer = build(:offer, benefit: '')
    offer.valid?
    expect(offer.errors[:benefit]).to include('não pode ficar em branco')
  end

  it 'role cannot be blank' do
    offer = build(:offer, role: '')
    offer.valid?
    expect(offer.errors[:role]).to include('não pode ficar em branco')
  end
end
