class Admin::UsersController < ApplicationController
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
end
