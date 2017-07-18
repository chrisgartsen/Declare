class AuthenticatedRouteConstraint

  def matches?(request)
    request.session[:user_id] != nil
  end

end
