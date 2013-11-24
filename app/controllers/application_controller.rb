class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_filter :authenticate_user!, unless: :using_static_controller

  def using_static_controller
    params[:controller] == "static"
  end

  def after_sign_in_path_for(user)
    authenticated_root_path
  end

  def after_sign_out_path_for(user)
    unauthenticated_root_path
  end

end
