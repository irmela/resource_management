class Project < ActiveRecord::Base
	has_many :jobs

	validates :name, presence: true
	validates :department, presence: true
	validates :color, presence: true
end
