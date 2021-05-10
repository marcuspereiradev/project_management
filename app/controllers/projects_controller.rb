class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @activity = Activity.new
  end

  def new
    @project = Project.new
  end

  def edit;  end


  def create
    @project = Project.new(project_params)
    if @project.save
      flash.now[:success] = "Project successfully created"
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      flash.now[:success] = "Project was successfully updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash.now[:success] = 'Project was successfully deleted.'
      redirect_to @project
    else
      flash.now[:error] = 'Something went wrong'
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
