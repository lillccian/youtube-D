class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title ,:default =>'none title'
      t.text :description
      t.integer :user_id
      t.integer :song_id
      t.timestamps
    end
  end
end
