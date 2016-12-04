class AddViewCountToSong < ActiveRecord::Migration[5.0]
  def change
  	add_column :songs, :view_count, :integer, :default => 0
  	add_index :songs, :view_count

  end
end
