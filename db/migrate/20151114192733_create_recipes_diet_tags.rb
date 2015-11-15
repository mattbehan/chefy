class CreateRecipesDietTags < ActiveRecord::Migration
  def change
    create_table :recipes_diet_tags do |t|
    	t.references :diet_tag, null: false, index: true
    	t.references :recipe, null: false, index: true

      t.timestamps null: false
    end
  end
end
