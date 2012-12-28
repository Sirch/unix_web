class DecommissionedFalseToServers < ActiveRecord::Migration
  def change
		change_column :servers, :decommissioned, :boolean, default: false
  end
end
