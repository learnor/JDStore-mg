class Account::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
      @favorites = current_user.favorites.order('id DESC')
  end
end
