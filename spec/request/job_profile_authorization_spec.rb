require 'rails_helper'
describe 'job profile', type: :request do
  context 'create' do
    it 'redirect to sign in' do
      job_opportunity = create(:job_opportunity)

      post job_opportunity_job_profiles_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'headhunter cannot enroll ' do
      headhunter = create(:headhunter)
      login_as headhunter, scope: :headhunter
      job_opportunity = create(:job_opportunity)

      post job_opportunity_job_profiles_path(job_opportunity), params: {}

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'cannot update' do
      job_opportunity = create(:job_opportunity)
      job_profile = create(:job_profile)
      put job_opportunity_job_profile_path(job_opportunity, job_profile), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'cannot update with user' do
      user = create(:user)
      login_as user, scope: :user
      job_opportunity = create(:job_opportunity)
      job_profile = create(:job_profile)
      put job_opportunity_job_profile_path(job_opportunity, job_profile), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end
 end
end