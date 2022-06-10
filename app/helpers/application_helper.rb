module ApplicationHelper
  def current_like(video)
    current_user&.liked_video?(video) ? 'liked.png' : 'like.png'
  end

  def current_dislike(video)
    current_user&.disliked_video?(video) ? 'disliked.png' : 'dislike.png'
  end
end
