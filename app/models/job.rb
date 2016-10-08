class Job < ActiveRecord::Base
  include IceCube

  has_paper_trail

  belongs_to :resource
  belongs_to :project

  validates :project_id, presence: true
  validates :resource_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  serialize :schedule, Hash

  def schedule=(new_schedule)
    if new_schedule != 'null'
      write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_schedule).to_hash)
    end
  end

  def converted_schedule
    the_schedule = Schedule.new(self.start_date)
    unless self.schedule.blank?
      the_schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.schedule).until(self.end_date))
    end
    the_schedule
  end

  scope :end_date_greater_than, lambda { |end_date| where(['end_date > ?', end_date]) }

  def short_info
    if self.description.empty?
      self.project.name
    else
      self.project.name + ' (' + self.description + ')'
    end
  end
end
