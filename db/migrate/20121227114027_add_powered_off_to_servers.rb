class AddPoweredOffToServers < ActiveRecord::Migration
  def change
		add_column :servers, :powered_off, :boolean, default: false
		add_column :servers, :powered_off_date, :date
  end
end
