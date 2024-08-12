class Product < ApplicationRecord
  include Ransackable

  belongs_to :category
  has_many :order_items
  has_many :product_sizes
  has_many :sizes, through: :product_sizes
  has_one_attached :image

  validates :name, :body_description, :price, presence: true
end
