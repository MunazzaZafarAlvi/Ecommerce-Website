class Payment < ApplicationRecord
    belongs_to :order
    enum type: { credit_card: 0, paypal: 1, bank_transfer: 2 }
end
