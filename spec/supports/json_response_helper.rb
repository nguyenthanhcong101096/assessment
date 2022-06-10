# frozen_string_literal: true

module JsonResponseHelper
  def response_401
    { message: 'Unauthorized' }
  end

  def response_user
    {
      username: String,
      email: String,
      access_token: String
    }
  end

  def response_video
    {
      id: Integer,
      video_url: String,
      video_title: String,
      count_likes: Integer,
      count_dislikes: Integer
    }
  end
end