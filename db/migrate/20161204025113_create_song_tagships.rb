class CreateSongTagships < ActiveRecord::Migration[5.0]
  def change
    create_table :song_tagships do |t|
    	t.integer  :song_id
    	t.integer  :tag_id

      t.timestamps
    end
    add_index :song_tagships, :song_id
    add_index :song_tagships, :tag_id
  end
end
