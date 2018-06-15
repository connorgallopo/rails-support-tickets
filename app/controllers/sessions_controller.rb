class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:email][:password])
      session[:user_id] = @user.id
      redirect_to tickets_path, notice: "Thanks for signing in"
    else
      redirect_to login_path
    end
  end
end
