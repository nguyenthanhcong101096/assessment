class Api::V1::VideosController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    @videos = Video.all

    render json: @videos, status: :ok
  end

  def create
    result = ShareVideoService.call(current_user, params[:url])

    if result
      render json: result, status: :ok
    else
      render json: { message: 'Something wrong' }, status: :unprocessable_entity
    end
  end
end