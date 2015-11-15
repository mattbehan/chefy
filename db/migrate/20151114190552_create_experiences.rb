class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
    	t.references :foody, index: true, null: false
    	t.references :chef, index: true, null: false
    	t.belongs_to :recipe, null: false
    	t.string :status, null: false
    	t.datetime :starts_at
      t.float :cost

      t.timestamps null: false
    end
  end
end
