class CommentsController < ApplicationController
  before_action :require_login
  def new; end

  def create
    @comment = Comment.create(comment_params)
    @comment.user = User.find(session[:user_id])
    @comment.save
    redirect_to ticket_path(@comment.ticket)
  end

  def show
    @comment ||= Comment.find(params[:id])
  end
  private

  def comment_params
    params.require(:comment).permit(:content, :ticket_id)
  end
end
