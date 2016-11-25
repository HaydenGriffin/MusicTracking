class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.integer :start
      t.string :genre

      t.timestamps
    end
  end
end
