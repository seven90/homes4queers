class CommentsController < ApplicationController
before_action :require_login, only: [:create, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @commentable = find_commentable

    @comment = @commentble.comments.build(comment_params)
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

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end

end
