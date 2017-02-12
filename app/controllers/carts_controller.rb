class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "Cart emptied!"
    redirect_to products_path
  end
end
