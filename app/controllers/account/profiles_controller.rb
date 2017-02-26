class Account::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_profile, only: [:edit, :update]

  def show
    @user = User.find_by(username: params[:username])
    #  @profile = current_user
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to account_profile_path(@user.username)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:avatar, :nick_name, :cell_number, :wechat_id, :address)
  end

  def owned_profile
    @user = User.find_by(username: params[:username])
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end
end
