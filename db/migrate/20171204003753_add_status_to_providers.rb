class AddStatusToProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :status, :integer, default: 0
  end
end
