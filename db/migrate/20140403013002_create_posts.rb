class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text   :url
      t.string   :category
      t.string   :accused
      t.string   :accuser
      t.text     :quote
      t.text     :excerpt
      t.string   :title
      t.integer  :user_id
      t.string   :date
      
      t.timestamps
    end
  end
end
