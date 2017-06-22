class SessionsController < ApplicationController

before_action :if_logged_in, only:[:new, :create]
before_action :if_not_logged_in, only:[:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
    params[:user][:user_name], params[:user][:password])

    if user
      login!(user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
  end

  def if_logged_in
    redirect_to cats_url if logged_in?
  end

  def if_not_logged_in
    redirect_to new_session_url unless logged_in?
  end

end
