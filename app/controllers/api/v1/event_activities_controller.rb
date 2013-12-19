class Api::V1::CompetitionActivitiesController < ApplicationController
  respond_to :json

  def index
    respond_with CompetitionActivity.all
  end

  def show
    respond_with CompetitionActivity.find(params[:id])
  end

  def create
    competition_activities = CompetitionActivity.new(competition_activities_params)
    if competition_activities.save
      render json: competition_activities
    else
      render json: competition_activities, status: 422
    end
  end

  def update
    competition_activities = CompetitionActivity.find(params[:id])
    if competition_activities.update(activities_params)
      render json: competition_activities
    else
      render json: competition_activities, status: 422
    end
  end

  def destroy
    competition_activities = CompetitionActivity.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def competition_activities_params
    params.require(:competition_activity).permit(:activity_id, :user_id, :competition_id)
  end
end