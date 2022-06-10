class Api::V1::SessionsController < Api::V1::BaseController
  def create
    @user = User.find_by(username: auth_params[:username])

    if @user&.valid_password?(auth_params[:password])
      token     = JwtService.jwt_encode(sub: @user.id)
      user_json = @user.slice(:username, :email).merge(access_token: token)

      render(json: user_json, status: :ok)
    else
      render(json: { message: 'Unauthorized' }, status: 401)
    end
  end

  private

  def auth_params
    params.require(:user).permit(:username, :password)
  end
end