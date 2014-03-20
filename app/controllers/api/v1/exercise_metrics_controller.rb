class Api::V1::ExerciseMetricsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with ExerciseMetric.where(id: params[:ids])
    else
      respond_with ExerciseMetric.all
    end
  end

  def show
    respond_with ExerciseMetric.find(params[:id])
  end

  def create
    exercise_metric = ExerciseMetric.new(exercise_metric_params)
    if exercise_metric.save
      render json: exercise
    else
      render json: {errors: exercise_metric.errors.messages}, status: 422
    end
  end

  def update
    exercise_metric = ExerciseMetric.find(params[:id])
    if exercise_metric.update(exercise_params)
      render json: exercise_metric
    else
      render json: {errors: exercise_metric.errors.messages}, status: 422
    end
  end

  def destroy
    exercise_metric = ExerciseMetric.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def exercise_metric_params
    params.require(:exercise_metric).permit(:metric_id, :exercise_id, :experience_multiplier)
  end
end
