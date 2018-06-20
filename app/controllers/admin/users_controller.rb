class Admin::UsersController < ApplicationController
  before_action :require_login
  before_action :require_admin
  skip_before_action :verify_authenticity_token
  def index; end

  def promote
    @user = User.find(params[:user_id])
    @user.admin = true
    @user.save
    redirect_to admin_users_path
  end

  def demote
    @user = User.find(params[:user_id])
    @user.admin = false
    @user.save
    redirect_to admin_users_path
  end

  private

  def require_admin
    redirect_to adminonly_path unless current_user.admin?
  end
end
