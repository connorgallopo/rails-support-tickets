class User < ApplicationRecord
  has_secure_password
  has_many :tickets
  has_many :comments, through: :tickets

  validates :email, uniqueness: true
  validates :email, presence: true
end
