class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authorize
    current_user
  end

  private

  def require_login
    if !authorize
      flash[:error] = "User not authorized"
      redirect_to users_login_path
    end

  end
  
end
