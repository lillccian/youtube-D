class FixUserprofileTobeString < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :profile
  	add_column :users, :profile, :string
  end
end
