class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.order(name: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:product).permit(:name)
  end

end