class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

  def index
  end

  def create
  	code = Code.find(params[:code_id])
  	comment = current_user.comments.new(comment_params)
  	comment.code_id = code.id
  	if comment.save
    else
      flash.now[:notice] = "コメントは0文字以上200文字以下で投稿してください。"
      redirect_to code_path(code.id)
    end
    @comments = code.comments
  end

  def destroy
  	comment = Comment.find(params[:code_id])
  	code = comment.code
  	comment.delete
  	@comments = code.comments
  end

  private
    def comment_params
    	params.require(:comment).permit(:user_id, :code_id, :comment, :body)
    end
end
