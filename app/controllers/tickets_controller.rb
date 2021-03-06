class TicketsController < ApplicationController
  before_action :require_login
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = User.find(session[:user_id])
    @ticket.status = "new"
      if @ticket.save
        redirect_to ticket_path(@ticket.id)
      else
        render :new
      end
  end

  def index
    if admin?
      @tickets = Ticket.all
    else
      @tickets = Ticket.where("user_id = ?", current_user.id)
    end
  end

  def show
    @ticket ||= Ticket.find(params[:id])
    @comment = Comment.new
  end

  def assign
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.assigned_to = current_user.id
    @ticket.save
    redirect_to ticket_path(@ticket)
  end
  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :due_date)
  end

end
