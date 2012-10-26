class FixServerOsColumn < ActiveRecord::Migration
  def up
		rename_column :servers, :os_id, :operating_system_id
  end

  def down
		rename_column :servers, :operating_system_id, :os_id
  end
end
