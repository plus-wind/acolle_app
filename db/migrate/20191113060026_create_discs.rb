class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|

      t.timestamps
    end
  end
end
