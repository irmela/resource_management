class Ressource < ActiveRecord::Base
	has_many :jobs

	validates :name, presence: true
	validates :department, presence: true
	validates :color, presence: true

	def name_and_id
    	"#{self.name} (#{self.id})"
  	end
end
