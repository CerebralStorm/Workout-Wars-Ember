class Api::V1::EventActivitiesController < ApplicationController
  respond_to :json

  def index
    respond_with EventActivity.all
  end

  def show
    respond_with EventActivity.find(params[:id])
  end

  def create
    event_activities = EventActivity.new(event_activities_params)
    if event_activities.save
      render json: event_activities
    else
      render json: event_activities, status: 422
    end
  end

  def update
    event_activities = EventActivity.find(params[:id])
    if event_activities.update(activities_params)
      render json: event_activities
    else
      render json: event_activities, status: 422
    end
  end

  def destroy
    event_activities = EventActivity.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def event_activities_params
    params.require(:event_activities).permit(:activity_id, :user_id, :actable_id, :actable_type)
  end
end