class JwtService
  class << self
    EXPIRED_TIME = 30.days
    ALGORITHM = 'HS256'

    def jwt_key
      Rails.application.secrets.secret_key_base
    end
  
    def jwt_encode(data = {})
      JWT.encode(payload(data), jwt_key, ALGORITHM)
    end
  
    def jwt_decode(token:)
      JWT.decode(token, jwt_key, true, algorithm: ALGORITHM).first
    end
  
    def payload(data)
      {
        exp: Time.current.to_i + EXPIRED_TIME.to_i,
        jti: SecureRandom.uuid
      }.merge(data)
    end
  end
end