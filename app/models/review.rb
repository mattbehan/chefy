class Review < ActiveRecord::Base

	belongs_to :reviewer, polymorphic: true
	belongs_to :experience

	validates :rating, presence: true
	validates :reviewer_id, presence: true
	validates :reviewer_type, presence: true, inclusion: {in: %w(Foody Chef)
end
