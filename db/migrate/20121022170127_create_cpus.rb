class CreateCpus < ActiveRecord::Migration
  def change
    create_table :cpus do |t|
      t.string :processor
      t.string :model
      t.integer :core_count
      t.integer :base_speed_mhz

      t.timestamps
    end
  end
end
