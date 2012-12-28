class AddDecommissionToServers < ActiveRecord::Migration
  def change
		add_column :servers, :decommissioned, :boolean
		add_column :servers, :decommissioned_date, :date
		add_column :servers, :decommissioned_by, :string
  end
end
