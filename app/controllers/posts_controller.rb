class PostsController < ApplicationController
  before_action :set_posts, only: [:edit, :destroy, :show, :update]

  def new
    @post = Post.new
  end

  def destroy
    @comments = @post.comments
    @post.destroy
    @comments.destroy
    redirect_to posts_index_path
  end

  def index
    @posts = Post.order(:id).reverse_order.page
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

  def set_posts
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content, :image, :category_id)
  end
end
