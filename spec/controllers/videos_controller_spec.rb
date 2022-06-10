require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  include_context "with authenticate user"

  describe 'GET #index' do
    before { create_list :video, 10, shared_by_id: user.id }
    
    subject { get :index }

    it_behaves_like "render index template"

    it 'return 10 videos' do
      is_expected
      expect(assigns(:videos).count).to eq(10)
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like "render new template"
  end

  describe 'POST #create' do
    subject { post :create, params: params, format: :html }

    context 'when params valid and create new video' do
      let(:params) { { url: 'https://www.youtube.com/watch?v=_XXMhbbHa24' } }

      it_behaves_like "should add new 1 record", Video

      it 'should redirect to detaill' do
        is_expected
        expect(response.code).to eq '302'
        expect(subject).to redirect_to(videos_path(id: Video.last.video_id))
      end
    end

    context 'when params invalid and render new template' do
      let(:params) { { url: nil } }

      it_behaves_like 'should not change record', Video
      it_behaves_like 'render new template'
    end
  end

  describe 'GET #show' do
    let(:video) { create :video, shared_by_id: user.id }
    
    subject { get :show, params: params }

    context 'when video is found' do
      let(:params) { { id: video.video_id } }  

      it_behaves_like 'render show template'

      it do
        is_expected
        expect(assigns(:video).video_id).to eq(video.video_id)
      end
    end

    context 'when video not found' do
      let(:params) { { id: 'video.video_id' } }
      
      it_behaves_like 'with response not found'
    end
  end
end
