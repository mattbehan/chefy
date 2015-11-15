class Experience < ActiveRecord::Base
	belongs_to :foody
	belongs_to :chef
	belongs_to :recipe

	validates :foody_id, presence: true
	validates :chef_id, presence: true
	validates :recipe_id, presence: true
	validates :status, presence: true, inclusion: {in: %w(past current upcoming)}
	validates :starts_at, presence: true
end
