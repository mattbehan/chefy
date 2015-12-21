class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :username, null: false


      t.timestamps null: false
    end
    add_index :chefs, :username, unique: true
  end
end
