class FixServerEnvironmentIdColumn < ActiveRecord::Migration
  def up
		rename_column :servers, :environment_id, :environment
  end

  def down
		rename_column :servers, :environment, :environment_id
  end
end
