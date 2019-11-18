class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :delivery_name_family_kanji, null: false
      t.string :delivery_name_first_kanji, null: false
      t.string :delivery_name_family_furigana, null: false
      t.string :delivery_name_first_furigana, null: false
      t.string :delivery_postal_code, null: false
      t.string :delivery_address_prefecture, null: false
      t.string :delivery_address_city, null: false
      t.string :delivery_address_number, null: false
      t.string :delivery_address_building
      t.integer :order_status, null: false
      t.integer :total_fee, null: false
      t.integer :postage, :default => 500
      t.timestamps null: false
    end
  end
end
