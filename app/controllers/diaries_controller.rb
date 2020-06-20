class DiariesController < ApplicationController
  before_action :authenticate_user!
  def index
    @diaries =Diary.all
  end

  def show
  end



  def edit
  end

  def new
    @diary =Diary.new
  end

  def create
    @diary =Diary.new(diary_params)
    @diary.user_id=current_user.id
    if @diary.save
    redirect_to diaries_path
    flash[:notice] ="投稿しました"
    else
      render 'new'
    end
  end

  private
  def diary_params
    params.require(:diary).permit(:artist_name,:live_name,:title,:impression,:date,:user_id,:setlist)
  end

end
