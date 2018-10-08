class PostsController < ApplicationController
  before_action :set_items, only: [:edit, :destroy, :show, :update]

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to posts_index_path
  end

  def index
    @posts = Post.order(:name).page params[:page]
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
  end

  private

  def set_items
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content, :image)
  end
end
