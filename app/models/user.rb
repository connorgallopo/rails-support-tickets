class User < ApplicationRecord
  has_many :tickets
  has many :comments, through: :tickets
end
