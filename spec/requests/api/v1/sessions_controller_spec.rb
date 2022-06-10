require "rails_helper"

RSpec.describe "/api/v1/sessions", type: :request do
  describe 'POST /api/v1/signin' do
    let(:user) { create :user, username: 'rspec', password: 'TestPassword1!' }

    subject { post api_v1_signin_path, params: { user: params } }

    context 'when login successfully' do
      let(:params) { { username: user.username, password: user.password } }

      it_behaves_like "with response success"

      it 'return user json' do
        is_expected
        expect(response.body).to be_json_as(response_user)
      end
    end

    context 'when login failure' do
      let(:params) { { username: 'user.username', password: user.password } }

      it_behaves_like "with response unauthorized"

      it 'return response 401' do
        is_expected
        expect(response.body).to be_json_as(response_401)
      end
    end
  end
end