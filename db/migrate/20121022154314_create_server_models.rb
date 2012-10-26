class CreateServerModels < ActiveRecord::Migration
  def change
    create_table :server_models do |t|
      t.string :name
      t.string :manufacturer
      t.integer :uheight

      t.timestamps
    end
  end
end
