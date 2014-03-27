class Api::V1::CompetitionUserExercisesController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with CompetitionUserExercise.where(id: params[:ids])
    else
      respond_with CompetitionUserExercise.all 
    end
  end

  def show
    respond_with CompetitionUserExercise.find(params[:id])
  end

  def create
    competition_user_exercise = CompetitionUserExercise.new(competition_user_exercise_params)
    if competition_user_exercise.save
      render json: competition_user_exercise
    else
      render json: {errors: competition_user_exercise.errors.messages}, status: 422
    end
  end

  def update
    competition_user_exercise = CompetitionUserExercise.find(params[:id])
    if competition_user_exercise.update(competition_user_exercise_params)
      render json: competition_user_exercise
    else
      render json: {errors: competition_user_exercise.errors.messages}, status: 422
    end
  end

  def destroy
    CompetitionUserExercise.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def competition_user_exercise_params
    params.require(:competition_user_exercise).permit(:user_exercise_id, :competition_id)
  end
end