class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
  end

  def show
    @author = User.find(params[:user_id])
    @post = @author.posts.find((params[:id]))
  end
end
