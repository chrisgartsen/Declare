class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if authenticate(user, params[:password])
      set_user_session(user.id)
      redirect_to(root_path)
    else
      flash[:error] = 'Login failed'
      render :new
    end
  end

  def destroy
    clear_user_session
    redirect_to(login_path)
  end

  private

  def authenticate(user, password)
    user && user.authenticate(password)
  end

  def set_user_session(user_id)
    session[:user_id] = user_id
  end

  def clear_user_session
    session[:user_id] = nil
  end

end
