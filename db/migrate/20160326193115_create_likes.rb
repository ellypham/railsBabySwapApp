class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
