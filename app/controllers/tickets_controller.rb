class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.create(ticket_params)
    @ticket.user = User.find(session[:user_id])
    @ticket.status = "new"
    @ticket.save
    redirect_to ticket_path(@ticket.id)
  end

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
  end
  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :due_date)
  end

end
