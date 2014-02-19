class Api::V1::CompetitionWinConditionsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with CompetitionWinCondition.where(id: params[:ids])
    else
      respond_with CompetitionWinCondition.all 
    end
  end

  def show
    respond_with CompetitionWinCondition.find(params[:id])
  end

  def create
    competition_win_condition = CompetitionWinCondition.new(competition_win_condition_params)
    if competition_win_condition.save
      render json: competition_win_condition
    else
      render json: {errors: competition_win_condition.errors.messages}, status: 422
    end
  end

  def update
    competition_win_condition = CompetitionWinCondition.find(params[:id])
    if competition_win_condition.update(competition_win_condition_params)
      render json: competition_win_condition
    else
      render json: {errors: competition_win_condition.errors.messages}, status: 422
    end
  end

  def destroy
    CompetitionWinCondition.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def competition_win_condition_params
    params.require(:competition_win_condition).permit(:name, :description)
  end
end