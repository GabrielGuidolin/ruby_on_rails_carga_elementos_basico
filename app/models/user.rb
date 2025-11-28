class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :email, presence: true
end