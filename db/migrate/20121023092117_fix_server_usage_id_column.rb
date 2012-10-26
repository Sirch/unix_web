class FixServerUsageIdColumn < ActiveRecord::Migration
  def up
		rename_column :servers, :serverusage_id, :usage
  end

  def down
		rename_column :servers, :usage, :serverusage_id
  end
end
