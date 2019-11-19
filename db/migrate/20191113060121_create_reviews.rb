class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.string :review_title, null: false
      t.text :review_content, null: false
      t.float :satisfaction, null: false
      t.timestamps null: false
    end
  end
end
