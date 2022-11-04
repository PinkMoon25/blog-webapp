class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts.includes(:comments)
  end

  def show
    @author = User.find(params[:user_id])
    @post = @author.posts.find((params[:id]))
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_count = 0
    @post.likes_count = 0
    if @post.save
      flash[:success] = 'Post created successfully!'
      redirect_to user_post_index_path(current_user)
    else
      flash.now[:error] = 'Post creation failed!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_post_show_path(current_user, @post)
    flash[:success] = 'Post deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
