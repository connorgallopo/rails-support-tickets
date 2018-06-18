class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :body, presence: true
  validates :title, presence: true

  def ticket_preview
    body
  end
end
