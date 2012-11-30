class AddIndexToServers < ActiveRecord::Migration
  def self.up
		add_index :servers, :name
		add_index :servers, :parent_id
		add_index :servers, :server_rack_id
		add_index :servers, :project_id
  end

	def self.down
		remove_index :servers, column: :name
		remove_index :servers, column: :parent_id
		remove_index :servers, column: :server_rack_id
		remove_index :servers, column: :project_id
	end
end
