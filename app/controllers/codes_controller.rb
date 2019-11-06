class CodesController < ApplicationController

  def index
  	@codes = Code.all

  	# where(deleted_flag: "false")
  end

  def show
 

  end

  def new
  	@code = Code.new
  end

  def create
  	@code = Code.create params.require(:code).permit(:title, :body, {photos: []})
  	@code = Code.new(code_params)
  	@code.save
  	redirect_to code_path(current_user.id)
  end

  def edit
  end

  private
  def code_params
  	params.require(:code).permit(:title, :body, photos: [])
  end
end
