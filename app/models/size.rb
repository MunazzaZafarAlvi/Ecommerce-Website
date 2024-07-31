class Size < ApplicationRecord
  enum name: { small: 0, medium: 1, large: 2 }
  has_many :product_sizes
  has_many :products, through: :product_size
end
