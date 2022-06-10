class RegistrationsController < BaseController
  skip_before_action :authenticate_user!, only: %i(create new)

  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.new(user_params)

    if user.valid? && user.valid_password?(params[:confirmation_password])
      user.save!
      sign_in(user)
      redirect_to(root_path)
    else
      flash[:alert] = 'Please check email exsits or password not the same'
      render :new
    end
  end

  private

  def user_params
    params.permit(:email, :password)
          .merge(username: params[:email].split('@').first)
  end
end
