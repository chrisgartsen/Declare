module ApplicationHelper

  def application_name
    ENV['APPLICATION_NAME']
  end

  def current_user
    user
  end

  def logged_in?
    session[:user_id] != nil
  end

  def user_name
    user ? user.name : nil
  end

  def is_admin?
    user ? user.admin : false
  end

  private

    def user
      @active_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
