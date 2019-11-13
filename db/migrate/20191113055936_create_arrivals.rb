class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :item_id, null: false
      t.integer :arrival_number, null: false
      t.timestamps null: false
    end
  end
end
