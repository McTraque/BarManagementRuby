class CreateBenches < ActiveRecord::Migration[5.1]
  def change
    create_table :benches do |t|
      t.integer :number
      t.integer :status

      t.timestamps
    end
  end
end
