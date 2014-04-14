class Api::V1::UserNotificationsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with UserNotification.where(id: params[:ids])
    else
      respond_with UserNotification.all 
    end
  end

  def show
    respond_with UserNotification.find(params[:id])
  end

  def create
    user_notification = UserNotification.new(user_notification_params)
    if user_notification.save
      render json: user_notification
    else
      render json: {errors: UserNotification.errors.messages}, status: 422
    end
  end

  def update
    user_notification = UserNotification.find(params[:id])
    if UserNotification.update(user_notification_params)
      render json: user_notification
    else
      render json: {errors: UserNotification.errors.messages}, status: 422
    end
  end

  def destroy
    user_notification = UserNotification.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def user_notification_params
    params.require(:user_notification).permit(:user_id, :notification_id, :time_period)
  end
end
