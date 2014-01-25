class Api::V1::CompetitionExercisesController < ApplicationController
  respond_to :json

  def index
    respond_with CompetitionExercise.all
  end

  def show
    respond_with CompetitionExercise.find(params[:id])
  end

  def create
    competition_exercise = CompetitionExercise.new(competition_exercise_params)
    if competition_exercise.save
      render json: competition_exercise
    else
      render json: {errors: competition_exercise.errors.messages}, status: 422
    end
  end

  def update
    competition_exercise = CompetitionExercise.find(params[:id])
    if competition_exercise.update(exercise_params)
      render json: competition_exercise
    else
      render json: {errors: competition_exercise.errors.messages}, status: 422
    end
  end

  def destroy
    competition_exercise = CompetitionExercise.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def competition_exercise_params
    params.require(:competition_exercise).permit(:exercise_id, :competition_id)
  end
end