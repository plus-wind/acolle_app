class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :item_id, null: false
      t.string :disc_name, null: false
      t.timestamps null: false
    end
  end
end
