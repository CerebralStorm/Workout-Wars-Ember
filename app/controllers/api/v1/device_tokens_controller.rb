class Api::V1::DeviceTokensController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.device_tokens
  end

  def create
    if current_user.add_device_token(params[:device_token])
      current_user.create_default_notifications if current_user.user_notifications.empty?
      render json: current_user.device_tokens
    else
      render json: {errors: "the device token was not added"}, status: 422
    end
  end

  def destroy
    if current_user.add_device_token(params[:device_token])
      render json: current_user.device_tokens
    else
      render json: {errors: "the device token was not added"}, status: 422
    end
  end
end