class ApplicationController < ActionController::Base
  def admin?
    current_user.admin
  end

  def require_login
    redirect_to forbidden_path  unless session.include? :user_id
  end
end
