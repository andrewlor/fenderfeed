class CategoriesController < ApplicationController
  def index
  end
  def show
    @posts = Post.where(category_id: params[:id]).limit(10)
    @category = Category.find(params[:id])
  end
end
