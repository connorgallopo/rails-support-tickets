class User < ApplicationRecord
  has_many :tickets
  has_many :comments, through: :tickets
end
