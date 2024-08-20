class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_one :payment
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  enum status: { pending: 'pending', completed: 'completed'}

  def total_amount
    order_items.sum { |item| item.quantity * item.price }
  end
end
