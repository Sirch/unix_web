class CreateServerRacks < ActiveRecord::Migration
  def change
    create_table :server_racks do |t|
      t.string :name
      t.integer :datacenter_id

      t.timestamps
    end
  end
end
