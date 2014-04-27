class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize
  before_filter :check_cookie

  helper_method :current_user

  protected

  def authorize
    unless User.where(id: session[:user_id]).first
      redirect_to root_url
    end
  end

  def check_cookie
    unless cookies[:showed_welcome_page]
      cookies[:showed_welcome_page] = { value: true }
      redirect_to welcome_path
    end
  end

  private

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end
