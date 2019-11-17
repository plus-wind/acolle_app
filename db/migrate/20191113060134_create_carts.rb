class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, index:true, foreign_key: true
      t.references :item, index:true, foreign_key: true
      t.integer :cart_item_number, null: false
      t.timestamps null: false
    end
  end
end
