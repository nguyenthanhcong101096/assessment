RSpec.shared_context "with authenticate user" do
  let!(:user) { create :user, username: 'test', email: 'test@gmail.com' }

  before { authenticate_user(user) }
end

RSpec.shared_context "with authenticate jwt" do
  let!(:user) { create :user, username: 'test', email: 'test@gmail.com' }
  let!(:token) { JwtService.jwt_encode(sub: user.id) }
  let(:headers) { {'Authorization': ["Bearer", token].join(" ")} }
end
