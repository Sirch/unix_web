class AddOsColumnToServer < ActiveRecord::Migration
  def change
		add_column :servers, :operating_system, :string
  end
end
