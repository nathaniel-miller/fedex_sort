class ReCreateSchedulesSortTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules_sort_types do |t|
      t.references :schedule, foreign_key: true
      t.references :sort_type, foreign_key: true
    end
  end
end
