class RenameRessourceToResource < ActiveRecord::Migration
  def change
     rename_table :ressources, :resources
     rename_column :jobs, :ressource_id, :resource_id
  end
end
