class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include AuthenticationHelper

  def check_authorisation
    redirect_to(login_path) unless logged_in?
  end

  def check_admin_authorisation
    redirect_to login_path unless is_admin?
  end

end
