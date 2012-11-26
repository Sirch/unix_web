class ChangeColumnOobToString < ActiveRecord::Migration
  def up
		change_column :servers, :oob_address, :string
  end

  def down
		change_column :servers, :oob_address, :inet
  end
end
