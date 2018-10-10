class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :destroy, :show, :update]

  def new
    @category = Category.new
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @posts = @category.posts
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
