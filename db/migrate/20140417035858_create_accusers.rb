class CreateAccusers < ActiveRecord::Migration
  def change
    create_table :accusers do |t|
    	t.string :title
    	t.integer :category_id
      t.timestamps
    end
  end
end
