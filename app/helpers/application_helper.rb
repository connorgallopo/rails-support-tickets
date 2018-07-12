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

  def form_errors_for(object = nil)
    render('shared/form_errors', object: object) unless object.blank?
  end
end
