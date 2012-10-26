class FixServerRackColumn < ActiveRecord::Migration
  def up
		rename_column :servers, :rack_id, :server_rack_id
  end

  def down
		rename_column :servers, :server_rack_id, :rack_id
  end
end
