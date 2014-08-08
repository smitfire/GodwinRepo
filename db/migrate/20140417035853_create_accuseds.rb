class CreateAccuseds < ActiveRecord::Migration
  def change
    create_table :accuseds do |t|
    	t.string :title
    	t.integer :category_id	
      t.timestamps
    end
  end
end
