class Account::FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index
        @favorite_products = current_user.favorite_products.order('id DESC')
    end
end
