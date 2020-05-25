# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  context 'Validation' do
    it 'email cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:title]).to include('não pode ficar em branco')
    end

    it 'description cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:description]).to include('não pode ficar em branco')
    end

    it 'skills cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:skills]).to include('não pode ficar em branco')
    end

    it 'salary cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:salary]).to include('não pode ficar em branco')
    end

    it 'job_level cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:job_level]).to include('não pode ficar em branco')
    end

    it 'end_data cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:end_data]).to include('não pode ficar em branco')
    end

    it 'location cannot be blank' do
      job_opportunity = JobOpportunity.new

      job_opportunity.valid?

      expect(job_opportunity.errors[:location]).to include('não pode ficar em branco')
    end

    it 'slary must be greater than 0' do
      job_opportunity = build(:job_opportunity, salary: -10)

      job_opportunity.valid?

      expect(job_opportunity.errors[:salary]).to include('deve ser maior que 0')
    end
  end
end
