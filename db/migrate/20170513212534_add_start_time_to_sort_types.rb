class AddStartTimeToSortTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :sort_types, :start_time, :time
  end
end
