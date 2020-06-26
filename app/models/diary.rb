class Diary < ApplicationRecord
	belongs_to :user
	attachment :live_image
	has_many :comment, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end
