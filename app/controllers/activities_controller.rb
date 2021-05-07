class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :update]

  def edit
    # debugger
  end

  def create
    @project = Project.find(params[:project_id])
    @activity = @project.activities.new(activity_params)
    if @activity.save
      flash[:success] = "Activity successfully created"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      redirect_to @project
    end
  end

  def update
      if @activity.update(activity_params)
        flash[:success] = "Activity was successfully updated"
        redirect_to @activity.project
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @project = Project.find(params[:id])
    @activity = @project.activities.find(params[:project_id])
    if @activity.destroy
      flash[:success] = 'Activity was successfully deleted.'
      redirect_to @project
    else
      flash[:error] = 'Something went wrong'
      redirect_to @project
    end
  end


  def finished
    @project = Project.find(params[:id])
    @activity = @project.activities.find(params[:project_id])
    @activity.finished = !@activity.finished
    @activity.save
    redirect_to @project
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_name, :start_date, :end_date)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
