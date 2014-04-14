class Api::V1::NotificationsController < ApplicationController
  respond_to :json

  def index
    if params[:ids]
      respond_with Notification.where(id: params[:ids])
    else
      respond_with Notification.all 
    end
  end

  def show
    respond_with Notification.find(params[:id])
  end

  def create
    notification = Notification.new(notification_params)
    if notification.save
      render json: notification
    else
      render json: {errors: Notification.errors.messages}, status: 422
    end
  end

  def update
    notification = Notification.find(params[:id])
    if Notification.update(notification_params)
      render json: notification
    else
      render json: {errors: Notification.errors.messages}, status: 422
    end
  end

  def destroy
    notification = Notification.find(params[:id]).destroy
    respond_with :no_content
  end

  private

  def notification_params
    params.require(:notification).permit(:name)
  end
end
