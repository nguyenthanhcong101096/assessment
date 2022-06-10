# frozen_string_literal: true

module Authenticable
  extend ActiveSupport::Concern
  
  EXPIRED_TIME = 30.days
  ALGORITHM = 'HS256'

  def authenticate_user!
    @current_user ||= User.find(jwt_decode['sub'])

    return if @current_user.present?

    rescue ActiveRecord::RecordNotFound
      render json: { message: 'unauthorized',        code: 'unauthenticated' }, status: :unauthorized
    rescue JWT::InvalidJtiError
      render json: { message: 'access_token_revoked', code: 'unauthenticated' }, status: :unauthorized
    rescue JWT::ExpiredSignature
      render json: { message: 'access_token_expired', code: 'unauthenticated' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { message: 'access_token_invalid', code: 'unauthenticated' }, status: :unauthorized
  end

  def current_user
    @current_user
  end

  def user_signed_in?
    @current_user = User.find_by(id: jwt_decode['sub'])
    @current_user.present?
  rescue JWT::DecodeError
    false
  end

  def token
    session[:access_token] || request.headers['Authorization']&.split&.last
  end

  def jwt_decode
    JwtService.jwt_decode(token: token)
  end
end
