class DietTag < ActiveRecord::Base
	has_many :recipe_diet_tags
	has_many :profile_diet_tags

	validates :name, presence: true
end
