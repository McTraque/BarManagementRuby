class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_type, foreign_key: true
      t.references :provider, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :value

      t.timestamps
    end
  end
end
