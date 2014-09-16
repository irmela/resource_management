class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :project_id
      t.integer :ressource_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
