class ApplicationController < ActionController::Base  
  helper :all
  protect_from_forgery
    
  private
  def current_user
	@current_user ||= User.find(session[:user_id]) if
	session[:user_id]
  end
  helper_method :current_user
  
  def logged_in?
	current_user
  end
  helper_method :logged_in?
  
  def check_login
	redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
  end
  
  rescue_from CanCan::AccessDenied do |exception|
	flash[:error] = "You are not authorized to do that."
	redirect_to home_path
  end
end
