class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :lockable,
         :timeoutable,
         :trackable

  has_many :videos, dependent: :destroy, foreign_key: :shared_by_id
  has_many :likes,  dependent: :destroy

  def like(video, type)
    like = likes.find_by(video: video)
    if like && (like.type == type)
      like.destroy
    elsif like && (like.type != type)
      like.update(type: type)
    else
      likes.create(video: video, type: type)
    end
  end

  def liked_video?(video)
    likes.exists?(video: video, type: 1)
  end

  def disliked_video?(video)
    likes.exists?(video: video, type: 2)
  end
end