require "rails_helper"

RSpec.describe "/api/v1/videos", type: :request do
  describe 'GET /api/v1/videos' do
    subject { get api_v1_videos_path, headers: headers }

    context 'when successfully and return videos list' do
      include_context "with authenticate jwt"
      
      before { create_list :video, 10, shared_by_id: user.id }

      it_behaves_like "with response success"

      it 'return videos json' do
        is_expected
        expect(response.body).to be_json_as(Array.new(10) { response_video })
      end
    end

    context 'when user unauthenticate' do
      it_behaves_like "with response unauthorized"
    end
  end
end