class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  def self.ransackable_attributes(auth_object = nil)
    column_names
  end
end
