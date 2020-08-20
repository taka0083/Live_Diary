class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,{only: :edit}
  before_action :set_diary,only:[:index,:search,:following]

#他の人が編集できないように
  def ensure_correct_user
    @diary =Diary.find(params[:id])
    if @diary.user_id != current_user.id
      redirect_to diaries_path
    end
  end

#上から投稿順で10投稿を表示
  def set_diary
    @diaries = Diary.page(params[:page]).per(10).reverse_order
  end

  def index
  end

  def search
    @diaries = @diaries.search(params[:search])
    if params[:tag_name]
      @diaries = @diaries.tagged_with("#{params[:tag_name]}")
    end
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
      redirect_to diary_path(@diary)
      flash[:notice] ="投稿しました"
    else
      render 'new'
    end
  end

  def destroy
    @diary =Diary.find(params[:id])
    if @diary.destroy
    redirect_to user_path(@diary.user)
    flash[:notice] ="削除しました"
    else
      render 'show'
    end
  end

  def following
    @diaries = @diaries.where(user_id:current_user.following_user.ids)
  end



  private
  def diary_params
    params.require(:diary).permit(:artist_name,:live_name,:title,:impression,:date,:user_id,:setlist,:live_image,:place, :tag_list, :latitude, :longitude)
  end

end
