class CommentsController < ApplicationController
  before_action :require_login
  def new; end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = User.find(session[:user_id])
    if @comment.save
      redirect_to ticket_path(@comment.ticket)
    else
      render :new
    end
  end

  def show
    @comment ||= Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :ticket_id)
  end
end
