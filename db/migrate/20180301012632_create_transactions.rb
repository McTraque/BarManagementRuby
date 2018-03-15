class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :product, foreign_key: true
      t.integer :quantity, default: 0
      t.integer :kind

      t.timestamps
    end
  end
end
