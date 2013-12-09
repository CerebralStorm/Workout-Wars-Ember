class Api::V1::EventJoinsController < ApplicationController
  respond_to :json

  def index
    respond_with EventJoin.all
  end

  def show
    respond_with EventJoin.find(params[:id])
  end

  def create
    event_join = EventJoin.new(event_join_params)
    if event_join.save
      render json: event_join
    else
      render json: event_join, status: 422
    end
  end

  def update
    event_join = EventJoin.find(params[:id])
    if event_join.update(event_join_params)
      render json: event_join
    else
      render json: event_join, status: 422
    end
  end

  def destroy
    EventJoin.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def event_join_params
    params.require(:event_join).permit(:user_id, :joinable_id, :joinable_type)
  end
end