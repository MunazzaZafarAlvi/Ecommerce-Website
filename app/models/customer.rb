class Customer < ApplicationRecord
  has_many :orders
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: trues
end
