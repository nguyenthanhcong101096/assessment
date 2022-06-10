# frozen_string_literal: true

module AuthenticateHelper
  def authenticate_user(user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  def authenticate_jwt(user)
    jti = SecureRandom.uuid
    exp = Time.current.to_i + 2.days.to_i
    token = JWT.encode({ sub: user.id, jti: jti, exp: exp }, Rails.application.secrets.secret_key_base, 'HS256')
  end
end
