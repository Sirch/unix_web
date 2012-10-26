class FixServerUsageTypeColumn < ActiveRecord::Migration
  def up
		remove_column :servers, :usage
		add_column :servers, :usage, :string
  end

  def down
		remove_column :servers, :usage
		add_column :servers, :usage, :integer
  end
end
