module ApplicationHelper

  def application_name
    ENV['APPLICATION_NAME']
  end


  def user_name
    user ? user.name : nil
  end

  private

    def user
      @active_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
