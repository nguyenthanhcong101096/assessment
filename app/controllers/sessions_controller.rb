class SessionsController < BaseController
  skip_before_action :authenticate_user!, only: %i(create new)

  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(username: params[:username])

    if user.blank?
      flash.now[:alert] = 'Username is not found'
      render :new
    elsif user.valid_password?(params[:password])
      sign_in(user)
      redirect_to(root_path)
    else
      flash.now[:alert] = 'Password is not correct'
      render :new
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
