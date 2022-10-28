class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.find(params[:id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      flash[:success] = 'Comment added successfully!'
      redirect_to user_all_posts_path(current_user, @post)
    else
      flash.now[:error] = 'comment creation failed!'
      render :new
    end
  end
end
