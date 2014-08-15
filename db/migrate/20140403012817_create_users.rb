class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :twitter
      t.string :password_digest
      t.string :password_confirmation
      t.string :pic

      t.timestamps
    end
    add_index :users, :id
  end
end
