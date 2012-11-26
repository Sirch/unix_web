class AddCpuTypeToServer < ActiveRecord::Migration
  def change
		add_column :servers, :cpu_type, :string
  end
end
