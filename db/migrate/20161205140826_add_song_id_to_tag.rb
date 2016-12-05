class AddSongIdToTag < ActiveRecord::Migration[5.0]
  def change
  	add_column :tags, :song_id, :integer
  	add_index :tags, :song_id
  end
end
