class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :project, index: true, foreign_key: true
      t.references :ressource, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
