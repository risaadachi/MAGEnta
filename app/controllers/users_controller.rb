class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit]
  before_action :authenticate_admin!, only: [:index, :admins_destroy]

  def show
  	@user = User.find(params[:id])
  	@codes = @user.codes
  end

  def edit
  	@user = User.find(params[:id])
  	if @user != current_user
  		redirect_to root_path
  	end
  end

  def update
  	user = User.find(params[:id])
  	user.update!(user_params)
    flash.now[:notice] = "ユーザ情報を更新しました"
  	redirect_to user_path(user)
  end


# adminß

  def admins_index
    @users = User.page(params[:page]).per(45)
  end

#    @users = User.where(deleted_flag: "false").page(params[:page]).per(9)


  def admins_destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to users_admins_path
  end


  private
  def user_params
  	params.require(:user).permit(:name, :gender, :age, :profile_image, :height, :email, :password, :password_confirmation)
  end

end
