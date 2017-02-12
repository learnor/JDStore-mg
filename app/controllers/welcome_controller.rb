class WelcomeController < ApplicationController
  def index
    flash[:notice]= "test"
  end
end
