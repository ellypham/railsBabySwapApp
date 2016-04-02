class DestroyUsersAndUserauths < ActiveRecord::Migration
  def change
  	drop_table :users 
  	drop_table :userauths
  end
end
