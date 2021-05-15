class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    unless params[:parent_id].present?
      @comment.parent_id = 0
    end
    @comment.save
    
    render :json => {comment: @comment, errors: @comment.errors }
  end

  private 
  def comment_params
    params.permit(:body, :post_id, :parent_id)
  end
end