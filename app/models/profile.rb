class Profile < ActiveRecord::Base
	belongs_to :user, polymorphic: true
	has_many :profile_diet_tags
	has_many :diet_tags, through: :profile_diet_tags
	

	validates :user_id, presence: true
	validates :user_type, presence: true, inclusion: {in: %w{Chef Foody}}
end
