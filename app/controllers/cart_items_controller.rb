class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "Remove #{@product.title} from cart successful"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "Change #{@cart_item.product.title} quantity to #{@cart_item.quantity} successful"
    else
      flash[:warning] = "Not enough quantity to add to cart"
    end
    
    redirect_to cart_path(current_cart)
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
