class ProjectsController < ApplicationController

  before_action :check_authorisation

  include AuthenticationHelper

  def new
    @project = current_user.projects.new
  end

  private

  def check_authorisation
    redirect_to(login_path) unless logged_in?
  end

end
