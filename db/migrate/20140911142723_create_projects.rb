class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :department
      t.string :color

      t.timestamps
    end
  end
end
