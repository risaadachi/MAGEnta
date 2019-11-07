class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit]
  before_action :authenticate_admin!, only: [:index]

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
  	redirect_to user_path(user)
  end


# admin

  def admins_index

  end





  private
  def user_params
  	params.require(:user).permit(:name, :gender, :age, :profile_image, :height, :email, :password, :password_confirmation)
  end

end
