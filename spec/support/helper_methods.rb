module HelperMethods

  def set_authentication(user)
    session[:user_id] = user.id
  end

  def clear_authentication
    session[:user_id] = nil
  end


  def login(user)
    visit root_path
    click_link 'log-in'
    within('form') do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'login-button'
    end
  end

end
