class FavoritesController < ApplicationController
        def create
            diary = Diary.find(params[:diary_id])
            favorite = current_user.favorites.new(diary_id: diary.id)
            favorite.save
            redirect_to prequest.referrer
        end
        def destroy
            diary = Diary.find(params[:diary_id])
            favorite = current_user.favorites.find_by(diary_id: diary.id)
            favorite.destroy
            redirect_to request.referrer
        end

≈
end
