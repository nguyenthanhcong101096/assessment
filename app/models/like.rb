class Like < ApplicationRecord
	# disable STI
	self.inheritance_column = :_type_disabled

  belongs_to :user
	belongs_to :video

	enum type: { like: 1, dislike: 2 }
end
  