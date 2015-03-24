class AddAllDayColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :all_day, :boolean
  end
end
