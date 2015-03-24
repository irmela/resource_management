class AddStatusToRessources < ActiveRecord::Migration
  def change
    add_column :ressources, :status, :boolean
  end
end
