class DiariesController < ApplicationController
  before_action :authenticate_user!
  def index
    @diaries =Diary.all
  end

  def show
    @diary=Diary.find(params[:id])
    @user = @diary.user
    @comment = Comment.new
  end

  def edit
    @diary=Diary.find(params[:id])
  end

  def update
    @diary=Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary)
    else
      render 'edit'
    end
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
    params.require(:diary).permit(:artist_name,:live_name,:title,:impression,:date,:user_id,:setlist,:live_image)
  end

end
