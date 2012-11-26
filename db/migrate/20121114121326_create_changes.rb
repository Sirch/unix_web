class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.string :added_by
      t.text :content

      t.timestamps
    end
  end
end
