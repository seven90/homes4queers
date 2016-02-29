class CommentsController < ApplicationController
# before_action :ensure_logged_in, only: [:create, :destroy]

def index
  @commentable = find_commentable
  @comments = @commentable.comments
end

def show
  @comment = Comment.find(params[:id])
end

def create
  @commentable = find_commentable

  @comment = @commentable.comments.build(comment_params)

  # @comment.user = current_user

  if @comment.save
    flash[:notice] = 'Comment successfully submitted'
    redirect_to
  else
    render :new
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
