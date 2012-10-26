class AddCommentColumnToProject < ActiveRecord::Migration
  def change
		add_column :projects, :comment, :string
  end
end
