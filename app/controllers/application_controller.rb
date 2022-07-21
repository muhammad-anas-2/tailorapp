class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :require_user
  helper_method :current_user ,:logged_in?
  before_action :set_locale

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  def logged_in?
    !!current_user
  end

  def require_user
    if  !logged_in?
      flash[:notice] = "Account is created successfully. You must be logged in now to perform actions "
      redirect_to login_path
    end
  end


  private
  #
  # def default_url_options
  #   { locale: I18n.locale }
  # end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

end
