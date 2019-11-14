class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id, null: false
      t.integer :category, null: false
      t.integer :contact_status, null: false
      t.text :text, null: false
      t.text :reply_text, null: false
      t.timestamps null: false
    end
  end
end
