class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates :content, presence: true

  # def initialize(ticket:)
  #   @comment.ticket = ticket
  # end
end
