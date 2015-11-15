class Pricing < ActiveRecord::Base

	belongs_to :pricable, polymorphic: true

	def self.calculate recipe_id, chef_id
		recipe = Recipe.find(recipe_id)
		chef = Chef.find(chef_id)
		surge = surge_rate
		( recipe.base_price + chef.profile.base_price ) * surge
	end

	def self.surge_rate
		rand(10..40)/10.0
	end

end
