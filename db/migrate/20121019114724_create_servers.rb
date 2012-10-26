class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.boolean :virtual
      t.integer :parent_id
      t.integer :datacenter_id
      t.string :serial
      t.integer :rack_id
      t.integer :model_id
      t.integer :os_id
      t.integer :cpu_number
      t.integer :cpu_id
      t.integer :ram
      t.string :environment_id
      t.integer :serverusage_id
      t.integer :responsible_team_id
      t.integer :project_id
      t.inet :oob_address

      t.timestamps
    end
  end
end
