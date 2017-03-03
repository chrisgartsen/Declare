class ProjectsController < ApplicationController

  before_action :check_authorisation

  include AuthenticationHelper

  def show
    @project = current_user.projects.find(params[:id])
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  private

  def check_authorisation
    redirect_to(login_path) unless logged_in?
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
