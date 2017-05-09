class AddStartDateToSortTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :sort_types, :start_date, :date
  end
end
