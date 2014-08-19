class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :title
    	t.string :key
      	t.timestamps
    end
    add_index :categories, :id
  end
end
