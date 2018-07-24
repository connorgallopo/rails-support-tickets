class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :body, presence: true
  validates :title, presence: true

  scope :for, ->(user_id) do
    where(assigned_to: user_id)
  end

  def ticket_preview
    body
  end

  def assigned_user
    User.find_by(id: self.assigned_to)
  end
end
