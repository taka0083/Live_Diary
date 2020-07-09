class DiariesController < ApplicationController
  before_action :authenticate_user!
  def index
    @diaries = Diary.page(params[:page]).per(10).reverse_order
    if params[:tag_name]
      @diaries = Diary.page(params[:page]).per(10).reverse_order.tagged_with("#{params[:tag_name]}")
    end
  end

  def search
    @diaries =Diary.page(params[:page]).per(10).reverse_order.search(params[:search])
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

  def follower
    @diaries = Diary.page(params[:page]).per(10).reverse_order.where(user_id:current_user.follower.ids)
  end

  private
  def diary_params
    params.require(:diary).permit(:artist_name,:live_name,:title,:impression,:date,:user_id,:setlist,:live_image,:place, :tag_list)
  end

end
