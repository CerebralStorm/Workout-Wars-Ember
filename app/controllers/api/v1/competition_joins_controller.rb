class Api::V1::CompetitionJoinsController < ApplicationController
  respond_to :json

  def index
    respond_with CompetitionJoin.all
  end

  def show
    respond_with CompetitionJoin.find(params[:id])
  end

  def create
    competition_join = CompetitionJoin.new(competition_join_params)
    if competition_join.save
      render json: competition_join
    else
      render json: competition_join, status: 422
    end
  end

  def update
    competition_join = CompetitionJoin.find(params[:id])
    if competition_join.update(competition_join_params)
      render json: competition_join
    else
      render json: competition_join, status: 422
    end
  end

  def destroy
    CompetitionJoin.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def competition_join_params
    params.require(:competition_join).permit(:user_id, :competition_id)
  end
end