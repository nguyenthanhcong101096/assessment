require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  include_context "with authenticate user"

  describe 'GET #index' do
    subject { get :index }

    before { create_list :video, 10, shared_by_id: user.id }

    it_behaves_like "render index template"

    it 'return 10 videos' do
      is_expected
      expect(assigns(:videos).count).to eq(10)
    end
  end
end