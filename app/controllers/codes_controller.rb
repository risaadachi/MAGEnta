class CodesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy]
  before_action :authenticate_admin!, only: [:admins_index, :admins_show, :admins_destroy, :admins_search]

  def index
  	@codes = Code.all
    @tag_list = Tag.all
    @search = @codes.ransack(params[:q])
    @search_codes = @search.result(distinct: true)
    # distinct: true 重複を避ける
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @codes = @tag.codes.order(time: "DESC")
      # order(time: "DESC")　時間の降順
    else
      @codes = Code.order(time: "DESC")
    end
  end

  def search
  end

  def show
  	@code = Code.find(params[:id])
    @comment = Comment.new
    @comments = @code.comments
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @codes = @tag.codes.order(time: "DESC")
      # order(time: "DESC")　時間の降順
    else
      @codes = Code.order(time: "DESC")
    end

  end

  def new
  	@code = Code.new
  end

  def create
  	@code = Code.new(code_params)
    # codeをnewする時に一緒にtagも保存。codetag、tagDBも一緒に
  	@code.user_id = current_user.id
    @tag_list = params[:code][:tagname].split(",")
    # split(",")=文字列を1文字ずつ分割  split=文字列を分割して配列にする場合に使用
    if @code.save!
       @code.save_codes(@tag_list)
       redirect_to root_path
    else
      render 'code/new'
    end
  end

  def edit
  	@code = Code.find(params[:id])
    @tag_list = @code.tags.pluck(:tagname).join(",")
  end

  def update
  	code = Code.find(params[:id])
    @tag_list = params[:code][:tagname].split(",")
    if code.update!(code_params)
      code.save_codes(@tag_list)
      redirect_to code_path(code)
    else
      render 'edit'
    end
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
 # params.require(:code).permit(:user_id, :title, :body, {photos: []}, {tag_id: []})
  params.require(:code).permit(:user_id, :title, :body, {photos: []}, {:tag_ids　=> [] })
end
end
