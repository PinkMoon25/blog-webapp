class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @author = User.find(params[:id])
    @user = current_user
  end
end
