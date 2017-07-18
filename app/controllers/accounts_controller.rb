class AccountsController < ApplicationController

  before_action :check_current_user

  def show
    @user = current_user
  end

  private

    def check_current_user
      redirect_to login_path unless current_user
    end

end
