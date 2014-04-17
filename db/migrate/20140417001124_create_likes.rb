class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :post_id
    add_index :likes, :comment_id
  end
end
