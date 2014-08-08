class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  :user_id, null: :false
      t.integer  :accused_id, null: :false
      t.integer  :accuser_id, null: :false
      # t.integer  :category_id, null: false
      t.text     :url
      t.string   :title
      # t.string   :accused, null: :false
      # t.string   :accuser, null: :false
      t.text     :quote
      t.text     :excerpt
      t.string   :event_date
      
      t.timestamps
    end
    add_index :posts, :id
    add_index :posts, :user_id
    add_index :posts, :accused_id
    add_index :posts, :accuser_id
    # add_index :posts, :category_id
  end
end
