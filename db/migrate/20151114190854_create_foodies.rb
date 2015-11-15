class CreateFoodies < ActiveRecord::Migration
  def change
    create_table :foodies do |t|

      t.timestamps null: false
    end
  end
end
