class DropSchedulesSortTypes < ActiveRecord::Migration[5.0]
  def change
    drop_table :schedules_sort_types
  end
end
