class AddDefaultStatusToProject < ActiveRecord::Migration
  def change
  	def change
	    change_column :projects, :status, :boolean, :default => true
	  end
  end
end
