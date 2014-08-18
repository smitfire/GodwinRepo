class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  :user_id, null: :false
      t.integer  :accused_id, null: :false
      t.integer  :accuser_id, null: :false
      t.text     :url
      t.text     :quote
      t.text     :context
      t.string   :event_date
      t.integer :likes_count, :integer, default: 0
      
      t.timestamps
    end

    add_index :posts, :id
    add_index :posts, :user_id
    add_index :posts, :accused_id
    add_index :posts, :accuser_id
  end
end
