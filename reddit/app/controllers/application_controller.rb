class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? 
  
  def log_in(user)
    session[:session_token] = user.reset_session_token
  end 
  
  def current_user 
    @current_user ||= User.find_by_session_token(session[:session_token])
  end 
  
  def logged_in?
    !!current_user
  end
  
  def log_out
    session[:session_token] = nil 
    current_user.reset_session_token
  end
  
  def require_login
    redirect_to new_session_url unless logged_in?
  end
end
