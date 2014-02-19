class Api::V1::ExercisesController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with Exercise.where(id: params[:ids])
    else
      respond_with Exercise.all 
    end
  end

  def show
    respond_with Exercise.find(params[:id])
  end

  def create
    exercise = Exercise.new(exercise_params)
    if exercise.save
      render json: exercise
    else
      render json: {errors: exercise.errors.messages}, status: 422
    end
  end

  def update
    exercise = Exercise.find(params[:id])
    if exercise.update(exercise_params)
      render json: exercise
    else
      render json: {errors: exercise.errors.messages}, status: 422
    end
  end

  def destroy
    exercise = Exercise.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :description)
  end
end
