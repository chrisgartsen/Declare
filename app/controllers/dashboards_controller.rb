class DashboardsController < ApplicationController

  before_action :check_authorisation

  def show
    @dashboard = Dashboard.new(user: current_user)
  end

end
