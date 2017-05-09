class AddEndDateToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :end_date, :date
  end
end
