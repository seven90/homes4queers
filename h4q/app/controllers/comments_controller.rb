class CommentsController < ApplicationController
before_action :ensure_logged_in, only: [:create, :destroy]

  def show
      @comment = Comment.find(params[:id])
  end

  def create
    @comment = @listing.comments.build(comment_params)
    @user_comment = @user.comments.build(comment_params)

    @comment.user = current_user

    if @comment.save
      redirect_to listings_path, notice: 'Comment successfully submitted'
    else
      render listing_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
