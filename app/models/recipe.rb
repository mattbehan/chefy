class Recipe < ActiveRecord::Base
	has_many :pricings, as: :pricable
	has_many :recipes_diet_tags
	has_many :experiences
	
	belongs_to :specialty
end
