class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.integer :track, unique: true
      t.integer :length
      t.belongs_to :album, foreign_key: true

      t.timestamps
    end
  end
end
