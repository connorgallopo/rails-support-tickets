class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  def ticket_preview
    body
  end
end
