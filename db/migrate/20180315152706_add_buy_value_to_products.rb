class AddBuyValueToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :buy_value, :decimal
    rename_column :products, :value, :sell_value
  end
end
