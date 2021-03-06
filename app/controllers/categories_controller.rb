class CategoriesController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to posts_path, notice: 'New Category created.'
    else
      render :new
    end
  end

  def show
    @category = Category.find_by_slug(params[:id])
  end

end