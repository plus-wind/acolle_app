class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.integer :cart_item_number, null: false
      t.timestamps null: false
    end
  end
end
