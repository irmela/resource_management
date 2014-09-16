class Job < ActiveRecord::Base
	belongs_to :ressource
	belongs_to :project
end
