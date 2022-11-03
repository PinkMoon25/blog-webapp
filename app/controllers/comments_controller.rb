class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      flash[:success] = 'Comment added successfully!'
      redirect_to user_post_show_path(current_user, @post)
    else
      flash.now[:error] = 'comment creation failed!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find_by(post_id: @post.id)
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
