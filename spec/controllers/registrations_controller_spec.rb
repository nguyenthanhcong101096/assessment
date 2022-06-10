require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
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
    subject { post :create, params: params }

    context 'when create user successfully' do
      let(:params) { { email: 'rspec@gmail', password: 'rspecpassword', confirmation_password: 'rspecpassword' } }

      it_behaves_like 'should add new 1 record', User

      it 'should redirect to root_path' do
        is_expected
        expect(response.code).to eq '302'
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'when create user failure' do
      context 'when confirmation_password not match' do
        let(:params) { { email: 'rspec@gmail', password: 'remitano', confirmation_password: 'remitano1' } }

        it_behaves_like "render new template"

        it 'should have error message' do
          is_expected
          expect(flash[:alert]).to eq('Please check email exsits or password not the same')
        end
      end
    end
  end
end
