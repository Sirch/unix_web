class AddPowerHeatToServerModels < ActiveRecord::Migration
  def change
		add_column :server_models, :power, :integer
		add_column :server_models, :power_sockets, :integer
		add_column :server_models, :heat_dissipation, :integer
  end
end
