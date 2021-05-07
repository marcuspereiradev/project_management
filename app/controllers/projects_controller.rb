class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Object successfully created"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = 'Project was successfully deleted.'
      redirect_to projects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to project_url
    end
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :start_date, :end_date)
  end
end
