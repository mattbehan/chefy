class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.references :reviewer, polymorphic: true, index: true, null: false
    	t.belongs_to :experience, index: true, null: false
    	t.integer :rating, null: false
    	t.text :comments


      t.timestamps null: false
    end
  end
end
