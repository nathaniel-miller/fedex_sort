class AddEndDateToSortTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :sort_types, :end_date, :date
  end
end
