class Order < ApplicationRecord
  belongs_to :bench
  has_many :items


  def total
    items.sum(&:total)
  end
end
