class Resource < ActiveRecord::Base
	has_many :jobs, dependent: :destroy

	validates :name, presence: true
	validates :department, presence: true
	validates :color, presence: true

  scope :ordered_by_department, lambda { order("department") }
  scope :with_department, lambda { |department| where(department: department) }
  scope :by_status, lambda { |status| where(status: status) }
end
