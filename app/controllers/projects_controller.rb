class ProjectsController < ApplicationController

  before_action :check_authorisation
  before_action :find_project, only: [:edit, :update, :destroy, :show]

  def show

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

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def index
    @projects = Project.all
  end

  def destroy
    @project.delete
    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end

    def find_project
      @project = current_user.projects.find(params[:id])
    end

end
