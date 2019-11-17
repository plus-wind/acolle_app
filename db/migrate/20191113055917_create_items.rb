class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :artist_id, null: false
      t.integer :label_id, null: false
      t.integer :genre_id, null: false
      t.string :item_name, null: false
      t.string :item_type, null: false
      t.string :item_image_id
      t.integer :item_price, null: false
      t.datetime :item_release_date, null: false
      t.integer :item_delete_flag, null: false
      t.integer :impressions_count, default: 0
      t.timestamps null: false
    end
  end
end
