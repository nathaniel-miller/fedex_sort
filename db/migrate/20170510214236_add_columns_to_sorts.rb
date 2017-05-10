class AddColumnsToSorts < ActiveRecord::Migration[5.0]
  def change
    add_column :sorts, :start_date, :date
    add_column :sorts, :end_date, :date
    add_column :sorts, :sort_type_id, :integer
  end
end
