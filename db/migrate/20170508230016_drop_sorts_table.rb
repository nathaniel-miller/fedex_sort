class DropSortsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :sorts
  end
end
