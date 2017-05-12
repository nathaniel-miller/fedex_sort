class ChangeColumnsInSorts < ActiveRecord::Migration[5.0]
  def change
    remove_column :sorts, :start_date
    remove_column :sorts, :end_date
    add_column :sorts, :date, :date
  end
end
