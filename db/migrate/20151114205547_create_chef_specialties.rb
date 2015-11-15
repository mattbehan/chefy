class CreateChefSpecialties < ActiveRecord::Migration
  def change
    create_table :chef_specialties do |t|
    	t.references :chef, index: true, null: false
    	t.references :specialty, index: true, null: false

      t.timestamps null: false
    end
  end
end
