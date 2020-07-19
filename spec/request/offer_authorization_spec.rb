require 'rails_helper'
describe 'offer', type: :request do
  context 'create' do
    it 'redirect to sign in' do
      job_opportunity = create(:job_opportunity)
      
      post job_opportunity_offers_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'just headhunter can create' do
      user = create(:user)
      login_as user, scope: :user
      job_opportunity = create(:job_opportunity)
      
      post job_opportunity_offers_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'must logged in for can accept' do
      job_opportunity = create(:job_opportunity)
      offer = create(:offer)

      put job_opportunity_offer_accept_path(job_opportunity,offer), params: {}

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'just user can accept' do
      headhunter = create(:headhunter)
      login_as headhunter, scope: :headhunter
      job_opportunity = create(:job_opportunity)
      offer = create(:offer)

      put job_opportunity_offer_accept_path(job_opportunity,offer), params: {}

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'must logged in for can accept' do
      job_opportunity = create(:job_opportunity)
      offer = create(:offer)

      put job_opportunity_offer_reject_path(job_opportunity,offer), params: {}

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'just user can accept' do
      headhunter = create(:headhunter)
      login_as headhunter, scope: :headhunter
      job_opportunity = create(:job_opportunity)
      offer = create(:offer)

      put job_opportunity_offer_reject_path(job_opportunity,offer), params: {}

      expect(response).to redirect_to(new_user_session_path)
    end
 end
end