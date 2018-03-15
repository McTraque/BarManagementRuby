class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :provider
  has_many :transactions
  enum status: { enable: 0, disabled: 1 }
  validates :name, :quantity, :sell_value, :buy_value, presence: true
end
