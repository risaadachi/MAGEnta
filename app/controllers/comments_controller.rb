class CommentsController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def create
  	code = Code.find(params[:code_id])
  	comment = current_user.comments.new(comment_params)
  	comment.code_id = code.id
  	comment.save
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
