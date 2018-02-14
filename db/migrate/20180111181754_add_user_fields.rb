class AddUserFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :id_card, :string
    add_column :users, :status, :integer, default: 0
  end
end
