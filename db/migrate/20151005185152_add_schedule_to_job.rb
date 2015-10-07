class AddScheduleToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :schedule, :text
  end
end
