require 'rails_helper'
describe 'job opportunity', type: :request do
  context 'create' do
    it 'redirect to sign in' do
      post  job_opportunities_path, params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'cannot destroy' do
      job_opportunity = create(:job_opportunity)
      delete job_opportunity_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'cannot update' do
      job_opportunity = create(:job_opportunity)
      put job_opportunity_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'cannot close' do
      job_opportunity = create(:job_opportunity)
      put close_job_opportunity_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end
 end
end