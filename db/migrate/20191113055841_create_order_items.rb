class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
		t.integer :order_id, null: false
		t.integer :item_id, null: false
		t.integer :order_price, null: false
		t.integer :order_number, null: false
		t.timestamps null: false
    end
  end
end
