class UsersController < ApplicationController
  skip_before_action :require_login
  
  def create
    @user = User.create(user_params)
    @user.save
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def login_form
  end
  
  def login
    user = User.find_by username: login_cred[:username]

    if user && user.authenticate(login_cred[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_sessions_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  
  private

  def user_params
    params
      .require(:user)
      .permit(:username, :email, :first_name, :first_name, :last_name, :password, :password_confirmation)
  end

  def login_cred
    params.permit(:username, :password)
  end
  
end
