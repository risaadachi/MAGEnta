class CodesController < ApplicationController

  def index
  end

  def show
  end

  def new
  	@code = Code.new
  end

  def create
  	code = Code.new(code_params)
  	code.save
  	redirect_to user_path(current_user.id)
  end

  def edit
  end

  private
  def code_params
  	params.require(:code).permit(:photo, :title, :body)
  end
end
