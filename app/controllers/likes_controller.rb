class LikesController < ApplicationController
  def create
    @post = current_user.posts.find(params[:id])
    @like = Like.new
    @like.author = current_user
    @like.post = @post
    if @like.save
      redirect_to user_all_posts_path(current_user, @post)
    else
      flash[:error] = 'Could not add likes'
    end
  end
end
