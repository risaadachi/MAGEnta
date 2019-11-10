class CodesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy]
  before_action :authenticate_admin!, only: [:admins_index, :admins_show, :admins_destroy, :admins_search]

  def index
  	@codes = Code.all

  	# where(deleted_flag: "false")
  end

  def show
  	@code = Code.find(params[:id])
    @comment = Comment.new
    @comments = @code.comments
  end

  def new
  	@code = Code.new
  end

  def create
  	@code = Code.create params.require(:code).permit(:user_id, :title, :body, {photos: []})
  	# activestorageで画像投稿のストロングパラメータ
  	@code = Code.new(code_params)
  	@code.user_id = current_user.id
  	@code.save
  	redirect_to root_path
  end

  def edit
  	@code = Code.find(params[:id])
  end

  def update
  	code = Code.find(params[:id])
  	code.update(code_params)
  	redirect_to code_path(code)
  end

  def destroy
  	code = Code.find(params[:id])
  	code.destroy
  	redirect_to user_path(current_user.id)
  end

# admin

  def admins_index
        @codes = Code.all
  end

  def admins_show
        @code = Code.find(params[:id])
  end

  def admins_destroy
  end

  def admins_search
  end


  private
  def code_params
  	params.require(:code).permit(:user_id, :title, :body, photos: [])
  end
end
