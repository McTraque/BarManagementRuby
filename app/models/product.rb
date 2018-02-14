class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :provider
  validates :name, :quantity, :value, presence: true
end
