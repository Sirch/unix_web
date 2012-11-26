class AddUserIdToServers < ActiveRecord::Migration
  def change
		add_column :servers, :added_by, :integer
		add_column :servers, :edited_by, :integer
  end
end
