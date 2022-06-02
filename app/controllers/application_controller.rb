class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_user
  helper_method :current_user ,:logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:notice] = "Account is created successfully. You must be logged in now to perform actions "
      redirect_to login_path
    end
  end
end
