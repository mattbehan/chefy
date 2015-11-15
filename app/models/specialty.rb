class Specialty < ActiveRecord::Base
	has_many :recipes
	has_many :chef_specialties
end
