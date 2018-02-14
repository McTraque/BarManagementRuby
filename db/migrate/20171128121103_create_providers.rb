class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :razon_social
      t.string :nit
      t.string :nombre_completo
      t.string :telefono
      t.string :email

      t.timestamps
    end
  end
end
