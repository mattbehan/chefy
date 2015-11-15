class RecipesDietTag < ActiveRecord::Base

	belongs_to :recipe 
	belongs_to :diet_tag

	validates :recipe_id, presence: true
	validates :diet_tag_id, presence: true
end
