class Api::V1::CompetitionsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with Competition.where(id: params[:ids])
    else
      respond_with Competition.all 
    end
  end

  def show
    respond_with Competition.find(params[:id])
  end

  def create
    competition = Competition.new(competition_params)
    if competition.save
      CompetitionJoin.create(competition: competition, user: current_user)
      render json: competition
    else
      render json: {errors: competition.errors.messages}, status: 422
    end
  end

  def update
    competition = Competition.find(params[:id])
    if competition.update(competition_params)
      render json: competition
    else
      render json: {errors: competition.errors.messages}, status: 422
    end
  end

  def destroy
    competition = Competition.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def competition_params
    params.require(:competition).permit(
      :name, 
      :user_id, 
      :max_participants, 
      :start_date, 
      :end_date, 
      :is_private, 
      :started,
      :description, 
      :competition_win_condition_id, 
      :competition_exercises_attributes => [:exercise_id, :competition_id, :_destroy]
    )
  end
end
