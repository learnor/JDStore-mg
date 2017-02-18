class FavoritesController < ApplicationController
    before_action :set_product

    def create
        if Favorite.create(product: @product, user: current_user)
            redirect_to :back, notice: "Product #{@product.title} has been favorited"
        else
            redirect_to :back, notice: "Something went wrong...favorite failed"
        end
    end

    def destroy
        Favorite.where(product: @product, user: current_user).first.destroy
        redirect_to :back, alert: "Removed product #{@product.title} from favorite"
    end

    private

    def set_product
        @product = Product.find(params[:product_id] || params[:id])
    end
end
