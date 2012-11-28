class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def ensure_current_user
    unless current_user
      flash[:error] = "Please log in first."
      redirect_to new_session_path and return
    end
  end



  def must_be_logged_in(user)
    unless user == current_user
      redirect_to root_path, :notice => "You must log in first." and return
    end
  end

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end


  def logged_in?(user)
    current_user == user
  end


end