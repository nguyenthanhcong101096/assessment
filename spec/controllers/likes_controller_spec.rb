require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  include_context "with authenticate user"

  describe 'POST #create' do
    let(:video) { create :video, shared_by_id: user.id }
    
    subject { post :create, params: {id: video.id, type: type}, format: :html }

    context 'when user like video' do
      let(:type) { 'like' }

      it_behaves_like "with response success"
      it_behaves_like "should add new 1 record", Like
    end

    context 'when user liked and unlike video' do
      let!(:like) { create :like, user_id: user.id, video_id: video.id, type: 'like' }
      let(:type) { 'like' }

      it_behaves_like "with response success"
      it_behaves_like "should delete 1 record", Like
    end
  end
end
