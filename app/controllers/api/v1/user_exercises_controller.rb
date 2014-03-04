class Api::V1::UserExercisesController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with UserExercise.where(id: params[:ids])
    else
      respond_with UserExercise.all 
    end
  end

  def show
    respond_with UserExercise.find(params[:id])
  end

  def create
    user_exercise = UserExercise.new(user_exercise_params)
    if user_exercise.save
      render json: user_exercise
    else
      render json: {errors: user_exercise.errors.messages}, status: 422
    end
  end

  def update
    user_exercise = UserExercise.find(params[:id])
    if user_exercise.update(user_exercise_params)
      render json: user_exercise
    else
      render json: {errors: user_exercise.errors.messages}, status: 422
    end
  end

  def destroy
    user_exercise = UserExercise.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def user_exercise_params
    params.require(:user_exercise).permit(:exercise_id, :user_id)
  end

end
