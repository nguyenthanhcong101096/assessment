class LikesController < BaseController
  before_action :set_video

  def create
    current_user.like(@video, params[:type])

    like_block = render_to_string(partial: 'videos/like', locals: { video: @video })

    render json: { like_block: like_block }, status: :ok
  end

  private

  def set_video
    @video = Video.find_by(id: params[:id])
  end
end
