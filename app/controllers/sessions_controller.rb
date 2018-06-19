class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    authenticated = user.try(:authenticate, params[:user][:password])
    binding.pry unless authenticated
    @user = user
    session[:user_id] = @user.id
    redirect_to tickets_path, notice: "Thanks for signing in"
  end


  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to root_path
    end
  end
  private
  def user_params
    params[:user]
  end
end
