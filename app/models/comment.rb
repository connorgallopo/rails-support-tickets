class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  # def initialize(ticket:)
  #   @comment.ticket = ticket
  # end
end
