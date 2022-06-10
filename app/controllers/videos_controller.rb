class VideosController < BaseController
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @videos = current_user.videos
  end
  
  def new; end

  def create
    result = ShareVideoService.call(current_user, params[:url])

    if result
      redirect_to videos_path(id: result.video_id)
    else
      flash[:alert] = 'Cannot get this link, try again'
      render :new
    end
  end

  def show
    @video = Video.find_by!(video_id: params[:id])
    @videos = Video.all.sample(10)
  end
end
