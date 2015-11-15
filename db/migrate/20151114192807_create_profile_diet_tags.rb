class CreateProfileDietTags < ActiveRecord::Migration
  def change
    create_table :profile_diet_tags do |t|
    	t.references :profile, index: true, null: false
    	t.references :diet_tag, index: true, null: false

      t.timestamps null: false
    end
  end
end
