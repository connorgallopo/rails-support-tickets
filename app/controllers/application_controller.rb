class ApplicationController < ActionController::Base
  def admin?
    current_user.admin
  end

  def current_user
    User.find(session[:user_id])
  end
  def require_login
    redirect_to forbidden_path  unless session.include? :user_id
  end
end
