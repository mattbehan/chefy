class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|

    	t.references :pricable, polymorphic: true, index: true
    	t.integer :base_price
    	t.integer :max_price
    	t.integer :surge_rate

      t.timestamps null: false
    end
  end
end
