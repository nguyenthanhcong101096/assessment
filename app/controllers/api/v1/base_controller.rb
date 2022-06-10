class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :exception, if: -> { session[:access_token].present? }

  include Authenticable
end