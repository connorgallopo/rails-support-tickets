class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new
    @ticket.user = User.find(session[:user_id])
    @ticket.save
    redirect_to ticket_path(@ticket.id)
  end

  def index
    @tickets = Ticket.all
  end
end
