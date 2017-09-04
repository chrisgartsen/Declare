class DashboardsController < ApplicationController

  before_action :check_authorisation

  def show
    @project = current_user.projects.find(params[:id])
  end

  def index
    @dashboard = Dashboard.new(user: current_user)
  end

end
