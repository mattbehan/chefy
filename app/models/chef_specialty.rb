class ChefSpecialty < ActiveRecord::Base
	belongs_to :chef
	belongs_to :specialty 

	validates :chef_id, presence: true
	validates :specialty_id, presence: true

	
end
