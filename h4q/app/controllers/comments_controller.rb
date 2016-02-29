class CommentsController < ApplicationController
before_action :ensure_logged_in, only: [:create, :destroy]

def show
  @comment = Comment.find(params[:id])
end

def create
  @commentable = find_commentable

  @comment = @commentble.comments.build(comment_params)
>>>>>>> 9e8fd7cf10accf517dee79600e4027141549c3b5

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
<<<<<<< HEAD
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
=======
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


>>>>>>> 9e8fd7cf10accf517dee79600e4027141549c3b5
end
