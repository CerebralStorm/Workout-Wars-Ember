class Api::V1::UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create] 
  skip_before_filter :verify_authenticity_token, only: [:create] 
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: {email: user.email, auth_token: user.authentication_token}, status: 201
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      respond_with :no_content
    else
      respond_with render json: @user.errors, status: :unprocessable_entity
    end
  end

  def get_current_user
    if current_user
      render json: current_user
    else 
      render json: {message: "Not currently signed in", status: :unprocessable_entity}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :height, :age, :weight)
  end
end
