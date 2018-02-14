class ChangeStatusToDefault < ActiveRecord::Migration[5.1]
  def change
      change_column :benches, :status, :integer, default: 0
  end
end
