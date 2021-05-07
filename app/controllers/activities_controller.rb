class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :update, :destroy]

  def edit;  end

  def create
    @activity = Activity.new(activity_params.merge({ project_id: params[:project_id] }))
    if @activity.save
      flash[:success] = "Activity successfully created"
      redirect_to @activity.project
    else
      flash[:error] = "Something went wrong"
      redirect_to @activity.project
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
    if @activity.destroy
      flash[:success] = 'Activity was successfully deleted.'
      redirect_to @activity.project
    else
      flash[:error] = 'Something went wrong'
      redirect_to @activity.project
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
    params.require(:activity).permit(:activity_name, :start_date, :end_date, :project_id)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
