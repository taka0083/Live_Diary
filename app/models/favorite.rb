class Favorite < ApplicationRecord
	belongs_to :user
  belongs_to :diary

   def favoriting
   	favorite =Favorite.where(id:favorite
   		.user_id)
   	favorite.user_id =user.id
   end
end
