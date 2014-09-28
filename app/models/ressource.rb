class Ressource < ActiveRecord::Base
	has_many :jobs

	def name_and_id
    	"#{self.name} (#{self.id})"
  	end
end
