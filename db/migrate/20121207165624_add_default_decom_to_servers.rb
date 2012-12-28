class AddDefaultDecomToServers < ActiveRecord::Migration
  def change 
		change_column :servers, :decommissioned, :boolean, default: true
  end
end
