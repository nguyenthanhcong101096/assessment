class VideoSerializer < ActiveModel::Serializer
  attributes :id, :video_url, :video_title, :count_likes, :count_dislikes

  def count_likes
    object.count_likes
  end

  def count_dislikes
    object.count_dislikes
  end
end
