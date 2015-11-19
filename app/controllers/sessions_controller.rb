class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user.nil?
      redirect_to new_user_url
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
