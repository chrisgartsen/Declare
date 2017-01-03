class UsersController < ApplicationController

  include ApplicationHelper

  before_action :check_current_user, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def check_current_user
      redirect_to login_path unless current_user
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
