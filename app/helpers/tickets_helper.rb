module TicketsHelper
  def assigned?(ticket)
    true if ticket.assigned_to != nil
  end
end
