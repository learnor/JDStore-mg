class Admin::CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required
    before_action :set_category, only: [:show, :edit, :destroy]

    def index
        @categories = Category.order("id DESC")
    end

    def show
    end

    def new
        @category = Category.new
        @categories = Category.all.map{|c| [ c.name, c.id ] }
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to admin_categories_path
        else
            render :new, alert: "Failed to add category"
        end
    end

    def edit
        @categories = Category.all.map{|c| [ c.name, c.id ] }
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
