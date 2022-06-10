require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    context 'when user login not yet' do
      it_behaves_like "render new template"
    end

    context 'when user already login' do
      include_context "with authenticate user"

      it 'should redirect to root_path' do
        is_expected
        expect(response.code).to eq '302'
        expect(subject).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create :user, username: 'testuser', password: 'password1' }

    subject { post :create, params: params }

    context 'when login failure' do
      context 'when wrong password' do
        let(:params) { { username: user.username, password: '13123' } }

        it_behaves_like "render new template"

        it 'should have error message' do
          is_expected
          expect(flash[:alert]).to eq('Password is not correct')
        end
      end

      context 'when user not found' do
        let(:params) { { username: 'testuser1', password: 'password1' } }

        it_behaves_like "render new template"

        it 'should have error message' do
          is_expected
          expect(flash[:alert]).to eq('Username is not found')
        end
      end
    end

    context 'when user login successfully' do
      let(:params) { { username: user.username, password: user.password } }

      it 'should redirect to root_path' do
        is_expected
        expect(controller.send(:current_user)).to eq(user)
        expect(response.code).to eq '302'
        expect(subject).to redirect_to(root_path)
      end
    end
  end
end
