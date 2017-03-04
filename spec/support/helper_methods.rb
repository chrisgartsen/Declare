module HelperMethods

  def set_authentication(user)
    session[:user_id] = user.id
  end

  def clear_authentication
    session[:user_id] = nil
  end

end
