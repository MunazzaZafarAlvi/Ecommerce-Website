class Category < ApplicationRecord
    enum name: { Ladies: 0, Gents: 1 }
    has_many :products
end
