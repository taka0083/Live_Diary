class Diary < ApplicationRecord
	belongs_to :user
	attachment :live_image
end
