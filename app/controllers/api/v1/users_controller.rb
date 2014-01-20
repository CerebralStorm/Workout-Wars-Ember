class Api::V1::UsersController < Api::V1::BaseController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token 

  respond_to :json
  def create 
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: {email: user.email, auth_token: user.authentication_token}, status: 201
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end
end