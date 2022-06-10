class Video < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :shared_by_id
  has_many   :likes, dependent: :destroy

  def count_likes
    likes.like.count
  end

  def count_dislikes
    likes.dislike.count
  end
end
