class AddSubjectToChanges < ActiveRecord::Migration
  def change
		add_column :changes, :subject, :text
  end
end
