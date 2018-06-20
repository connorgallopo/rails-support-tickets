class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if passwords_match?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to tickets_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def passwords_match?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
