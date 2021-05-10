class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :update, :destroy, :finished?]
  def index
    redirect_to project_path(id: params[:project_id])
  end

  def edit;  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash.now[:success] = "Activity successfully created"
      redirect_to @activity.project
    else
      @project = @activity.project
      render "/projects/show"
    end
  end

  def update
      if @activity.update(activity_params)
        flash.now[:success] = "Activity was successfully updated"
        redirect_to @activity.project
      else
        render 'edit'
      end
  end

  def destroy
    if @activity.destroy
      flash.now[:success] = 'Activity was successfully deleted.'
      redirect_to @activity.project
    else
      redirect_to @activity.project
    end
  end


  def finished?
    @activity.finished = !@activity.finished
    @activity.save
    redirect_to @activity.project
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_name, :start_date, :end_date, :project_id)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
