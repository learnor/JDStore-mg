class ProductsController < ApplicationController
  def index
    @categories = Category.order("id DESC")
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], per_page: 6) #Product.order("id DESC")#
    @categories.each do |c|
        instance_variable_set("@products_#{c.id}", Product.where(category_id: c.id))
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "Add #{@product.title} to shopping cart successful"
    else
      # TODO: add one 1 to quantity
      flash[:warning] = "#{@product.title} is already in your cart!"
    end
    redirect_to :back
  end
end
