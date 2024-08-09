class ProductSize < ApplicationRecord
  belongs_to :product
  belongs_to :size
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "product_id", "quantity", "size_id", "updated_at"]
  end
end
