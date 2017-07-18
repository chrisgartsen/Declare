class Dashboard

  def initialize(args = {})
    @user = args[:user]
  end

  def user
    @user
  end

  def user_name
    @user.name
  end

end
