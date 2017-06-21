class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  protect_from_forgery with: :exception

  def current_user
    return nil unless session[:session_token]
    current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

  # def log_out
  #   redirect_to new_session_url
  # end
end
