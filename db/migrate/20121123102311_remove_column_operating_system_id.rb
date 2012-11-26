class RemoveColumnOperatingSystemId < ActiveRecord::Migration
  def up
		remove_column :servers, :operating_system_id
  end

  def down
		add_column :servers, :operating_system_id, :string
  end
end
