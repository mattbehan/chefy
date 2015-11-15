class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.references :specialty, index: true
    	t.string :name, null: false
    	t.integer :max_price, null: false
    	t.integer :base_price, null: false

      t.timestamps null: false
    end
  end
end
