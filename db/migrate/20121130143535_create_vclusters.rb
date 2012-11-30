class CreateVclusters < ActiveRecord::Migration
  def change
    create_table :vclusters do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
