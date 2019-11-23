class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
		t.references :order_id, null: false, index:true, foreign_key: true
		t.references :item_id, null: false, index:true, foreign_key: true
		t.integer :order_price, null: false
		t.integer :order_number, null: false
		t.timestamps null: false
    end
  end
end
