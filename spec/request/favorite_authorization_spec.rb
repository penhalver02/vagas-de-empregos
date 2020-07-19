require 'rails_helper'
describe 'favorite', type: :request do
  context 'create' do
    it 'redirect to sign in' do
      profile = create(:profile)
      
      post profile_favorites_path(profile), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end

    it 'cannot destroy' do
      profile = create(:profile)
      favorite = create(:favorite, profile: profile)
      delete profile_favorite_path(profile,favorite), params: {}

      expect(response).to redirect_to(new_headhunter_session_path)
    end
 end
end