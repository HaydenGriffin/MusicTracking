class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column(:Songs, :length, :string)
  end
end
