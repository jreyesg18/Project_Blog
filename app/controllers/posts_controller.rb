class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id= current_user.id

    if @post.save
      redirect_to root_path, { success: "post was created"}
    else
      redirect_to new_post_path, { success: "post was not created"}
    end
  end

  def show

  end

  def edit

  end

  private
  def post_params
    params.require(:post).permit(:image, :image_cache, :description)
  end

  def find_post
    @post = Post.find(params[:id])
  end


end
