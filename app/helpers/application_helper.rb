module ApplicationHelper
  def logged_in?
    true if session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def admin?
    current_user.admin == true
  end
end
