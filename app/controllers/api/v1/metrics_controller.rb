class Api::V1::MetricsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with Metric.where(id: params[:ids])
    else
      respond_with Metric.all 
    end
  end

  def show
    respond_with Metric.find(params[:id])
  end

  def create
    metric = Metric.new(metric_params)
    if metric.save
      render json: metric
    else
      render json: {errors: metric.errors.messages}, status: 422
    end
  end

  def update
    metric = Metric.find(params[:id])
    if metric.update(metric_params)
      render json: metric
    else
      render json: {errors: metric.errors.messages}, status: 422
    end
  end

  def destroy
    metric = Metric.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def metric_params
    params.require(:metric).permit(:name, :measurement)
  end
end
