class CreateYtlinks < ActiveRecord::Migration[5.0]
  def change
    create_table :ytlinks do |t|
    	t.string :name
    	t.string :link
    	t.integer :user_id
    	t.integer :song_id

      t.timestamps
    end
  end
end
