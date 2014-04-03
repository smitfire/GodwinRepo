class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.string :color

      t.timestamps
    end
    add_index :tags, :title, :unique => true
  end
end
