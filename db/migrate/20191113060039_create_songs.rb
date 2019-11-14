class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :song, null: false
      t.integer :disc_id, null: false
      t.timestamps null: false
    end
  end
end
