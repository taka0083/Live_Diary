class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@diaries =@user.diaries
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user)
  	else
  		render 'edit'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name,:email,:user_image)
  end

end

