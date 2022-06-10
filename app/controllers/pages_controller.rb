class PagesController < BaseController
  skip_before_action :authenticate_user!

  def index
    @videos = Video.all
  end

  def not_found
    render_404
  end
end
