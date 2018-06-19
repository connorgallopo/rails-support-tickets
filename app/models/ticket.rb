class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :body, presence: true
  validates :title, presence: true

  def ticket_preview
    body
  end

  def assigned_user
    User.find(self.assigned_to)
  end
end
