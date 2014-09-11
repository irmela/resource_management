class CreateRessources < ActiveRecord::Migration
  def change
    create_table :ressources do |t|
      t.string :name
      t.string :department

      t.timestamps
    end
  end
end
