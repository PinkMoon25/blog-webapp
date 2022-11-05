class Api::PostsController < ApplicationController
  before_action :set_format, :authenticate_request
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    render json: @comments
  end

  private

  def set_format
    request.format ||= :json
  end
end
