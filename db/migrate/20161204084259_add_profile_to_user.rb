class AddProfileToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :song_id, :integer
  	add_column :users, :nickname, :string
  	add_column :users, :role, :string
  	add_column :users, :profile, :integer
  	add_index :users, :song_id
  end
end
