class Bench < ApplicationRecord
  validates :number, :status, presence: true, uniqueness: true
  enum status: { libre: 0, ocupada: 1 }
end
