class Transaction < ApplicationRecord
  belongs_to :product
  enum kind: { add: 0, substract: 1 }
  validates :quantity, presence: true
end
