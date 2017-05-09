class AddStartDateToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :start_date, :date
  end
end
