class Ressource < ActiveRecord::Base
	has_many :jobs, dependent: :destroy

	validates :name, presence: true
	validates :department, presence: true
	validates :color, presence: true
end
