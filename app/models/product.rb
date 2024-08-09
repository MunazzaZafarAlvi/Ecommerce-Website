class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :product_sizes
  has_many :sizes, through: :product_sizes
  has_one_attached :image

  validates :name, :body_description, :price, presence: true
  def self.ransackable_associations(auth_object = nil)
    column_names
  end
  def self.ransackable_attributes(auth_object = nil)
    column_names
  end
end
