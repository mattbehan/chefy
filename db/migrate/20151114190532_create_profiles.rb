class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.references :user, polymorphic: true, index: true, null: false
    	t.integer :age
    	t.string :gender
    	t.text :bio
    	t.float :base_price
    	t.float :max_price


      t.timestamps null: false
    end
  end
end
