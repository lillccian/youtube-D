class CreateKeeps < ActiveRecord::Migration[5.0]
  def change
    create_table :keeps do |t|
    	t.integer  :user_id,:index => true
    	t.integer  :song_id,:index => true
      t.timestamps
    end
  end
end
