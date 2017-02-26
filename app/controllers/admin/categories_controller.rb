class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
      @categories = Category.order("id DESC")
  end

  def show
  end

  def new
      @category = Category.new
  end

  def create
      @category = Category.new(category_params)
      if @category.save
          redirect_to admin_categories_path, notice: "Create category info successful"
      else
          render :new, alert: "Failed to add category"
      end
  end

  def edit
  end

  def update
      if @category.update(category_params)
          redirect_to admin_categories_path, notice: "Update category info successful"
      else
          render :edit, alert: "Failed to update category, try again"
      end
  end

  def destroy
      @category.destroy
      redirect_to admin_categories_path, warning: "Category deleted successful"
  end
  private

  def category_params
      params.require(:category).permit(:name, :description)
  end
  def set_category
      @category = Category.find(params[:id])
  end
end
