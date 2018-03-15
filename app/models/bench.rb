class Bench < ApplicationRecord
  validates :number, presence: true, uniqueness:  true
  enum status: { libre: 0, ocupada: 1 }
end
