class CodesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :authenticate_admin!, only: [:admins_index, :admins_show, :admins_destroy, :admins_search]
  impressionist :actions => [:show], :unique => [:session_hash]

  def index
  	@codes = Code.all
    @tag_list = Tag.all
    @search = @codes.ransack(params[:q])
    @search_codes = @search.result(distinct: true).page(params[:page]).reverse_order
    # distinct: true 重複を避ける
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @codes = Codetag.where(tag_id: @tag.id).order("id")
    else
      @codes = Code.order("id")
    end
  end

  def search
  end

  def ranking
    @mv = Code.order('impressions_count DESC').take(12)
  end

  def show
  	@code = Code.find(params[:id])
    impressionist(@code, nil, :unique => [:session_hash])
    #  pv計測の記述
    @comment = Comment.new
    @comments = @code.comments
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @codes = Codetag.where(tag_id: @tag.id).order("id")
    else
      @codes = Code.order("id")
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
      flash.now[:aaa] = "投稿したコーディネートを更新しました"
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
  @codes = Code.page(params[:page]).per(15)
end

def admins_show
  @code = Code.find(params[:id])
  @comments = @code.comments
end

def admins_destroy
    code = Code.find(params[:id])
    code.destroy
    redirect_to codes_admins_path
end

def admins_search
end


private
def code_params
 # params.require(:code).permit(:user_id, :title, :body, {photos: []}, {tag_id: []})
  params.require(:code).permit(:user_id, :title, :body, {photos: []}, {:tag_ids　=> [] })
end

end
