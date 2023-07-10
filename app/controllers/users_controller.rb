class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC").active
  end

  def search
    @users = User.where("username LIKE ?","%" + params[:q] + "%")
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :lastname, :website, :description, :image, :image_cache)
  end

  def set_user
    @user = User.find_by_username(params[:username])
  end

end
