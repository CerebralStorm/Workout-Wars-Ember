class Api::V1::ChallengeAttemptsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with ChallengeAttempt.where(id: params[:ids])
    else
      respond_with ChallengeAttempt.all 
    end
  end

  def show
    respond_with ChallengeAttempt.find(params[:id])
  end

  def create
    challenge_attempt = ChallengeAttempt.new(challenge_attempt_params)
    if challenge_attempt.save
      render json: challenge_attempt
    else
      render json: {errors: challenge_attempt.errors.messages}, status: 422
    end
  end

  def update
    challenge_attempt = ChallengeAttempt.find(params[:id])
    if challenge_attempt.update(challenge_params)
      render json: challenge_attempt
    else
      render json: {errors: challenge_attempt.errors.messages}, status: 422
    end
  end

  def destroy
    ChallengeAttempt.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def challenge_attempt_params
    params.require(:challenge_attempt).permit(:name, :user_id, :challenge_id, :result)
  end
end
