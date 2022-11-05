class Api::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_format, :authenticate_request

  def create
    @comment = Comment.new(author_id: params[:user_id], post_id: params[:id],
                           text: comment_params[:text])
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_format
    request.format ||= :json
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
