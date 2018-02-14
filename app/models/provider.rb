class Provider < ApplicationRecord
  validates :status, :razon_social, :nit, :nombre_completo, :telefono, :email, presence: true
  enum status: { enable: 0, disabled: 1 }
end
