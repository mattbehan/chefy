class Chef < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chef_specialties
  has_many :specialties, through: :chef_specialties
  has_many :experiences
  has_many :pricings, as: :pricable
  has_many :recipes, through: :specialties
  has_many :reviews
  has_one :profile, as: :user

  
end
