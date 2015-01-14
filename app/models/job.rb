class Job < ActiveRecord::Base
	belongs_to :ressource
	belongs_to :project

	validates :project_id, presence: true
	validates :ressource_id, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true

  def short_info
    if self.description.nil?
      self.project.name
    else
      self.project.name + ' (' + self.description + ')'
    end
  end
end
