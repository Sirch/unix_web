class CreateOperatingSystems < ActiveRecord::Migration
  def change
    create_table :operating_systems do |t|
      t.string :name, :length => 128
      t.string :version, :length => 64
      t.string :release, :length => 64
      t.string :comment

      t.timestamps
    end
  end
end
