class Api::V1::ChallengesController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with Challenge.where(id: params[:ids])
    else
      respond_with Challenge.all 
    end
  end

  def show
    respond_with Challenge.find(params[:id])
  end

  def create
    challenge = Challenge.new(challenge_params)
    if challenge.save
      render json: challenge
    else
      render json: {errors: challenge.errors.messages}, status: 422
    end
  end

  def update
    challenge = Challenge.find(params[:id])
    if challenge.update(challenge_params)
      render json: challenge
    else
      render json: {errors: challenge.errors.messages}, status: 422
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :max_participants)
  end
end
