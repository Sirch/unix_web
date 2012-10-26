class CreateDatacenters < ActiveRecord::Migration
  def change
    create_table :datacenters do |t|
      t.string :name
      t.string :address
      t.string :postcode, :length => 20
      t.string :comment

      t.timestamps
    end
  end
end
