class FixServerModelColumn < ActiveRecord::Migration
  def up
		rename_column :servers, :model_id, :server_model_id
  end

  def down
		rename_column :servers, :server_model_id, :model_id
  end
end
