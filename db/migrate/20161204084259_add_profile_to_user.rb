class AddProfileToUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :songs, :song_id, :integer
  	remove_column :songs, :nickname, :string
  	remove_column :songs, :role, :string
  	remove_column :songs, :profile, :integer
  	
    add_column :users, :song_id, :integer
  	add_column :users, :nickname, :string
  	add_column :users, :role, :string
  	add_column :users, :profile, :integer
  	add_index :users, :song_id
  end
end
