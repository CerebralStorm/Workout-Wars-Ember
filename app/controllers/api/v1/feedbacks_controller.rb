class Api::V1::FeedbacksController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with Feedback.where(id: params[:ids])
    else
      respond_with Feedback.all 
    end
  end

  def show
    respond_with Feedback.find(params[:id])
  end

  def create
    feedback = Feedback.new(feedback_params)
    if feedback.save
      render json: feedback
    else
      render json: {errors: feedback.errors.messages}, status: 422
    end
  end

  def update
    feedback = Feedback.find(params[:id])
    if feedback.update(feedback_params)
      render json: feedback
    else
      render json: {errors: feedback.errors.messages}, status: 422
    end
  end

  def destroy
    feedback = Feedback.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :subject, :content)
  end
end
