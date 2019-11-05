class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!

  def show
  end

  def edit
  end
end
