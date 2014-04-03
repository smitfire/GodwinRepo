class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :url
      t.string   :category
      t.string   :target
      t.string   :accuser
      t.text     :excerpt
      t.string   :title
      t.integer  :user_id
      t.string   :date
      
      t.timestamps
    end
  end
end
