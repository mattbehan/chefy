require "ffaker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
	chef = Chef.create(email: FFaker::Internet.email, password: "password")
	profile = Profile.create(name: FFaker::Name.name, user_id: chef.id, user_type: "Chef", base_price: 25)

end

10.times do 
	foody = Foody.create(email: FFaker::Internet.email, password: "password")
	profile = Profile.create(name: FFaker::Name.name, user_id: foody.id, user_type: "Foody")
end

specialties = %w(Albanian American Argentinian BBQ Belgian Brazilian Breakfast British Burmese Cajun Caribbean Cuban Dessert English Hamburgers Indian Mexican Sandwiches Sushi Thai Vietnamese)
specialties_list = specialties

specialties.length.times do
	specialty = Specialty.create(name: specialties_list.shift )
	3.times do
		chef = Chef.all.sample
		recipe = Recipe.create(specialty_id: specialty.id, name: (FFaker::Food.meat + " " +FFaker::Food.vegetable + " " + FFaker::Food.herb_or_spice), max_price: rand(100..300), base_price: rand(20..100) )
		chef_specialty = ChefSpecialty.create(chef_id: chef.id, specialty_id: specialty.id )
	end
end

def rand_time(from, to=Time.now)
  Time.at(rand(from.to_f..to.to_f))
end

100.times do
	experience = Experience.new
	experience.recipe_id = Recipe.all.sample.id 
	experience.chef_id = Chef.all.sample.id 
	experience.foody_id = Foody.all.sample.id 
	experience.status = %w(past current upcoming).sample
	if experience.status == "past"
		experience.starts_at = rand_time(364.days.ago)
	elsif experience.status == "upcoming"
		experience.starts_at = rand_time(Time.now, 1.year.from_now)
	else
		experience.starts_at = Time.now
	end
	experience.cost = rand(40..500)
	experience.save
end