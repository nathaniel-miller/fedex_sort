class AddScheduleIdToResponsibilities < ActiveRecord::Migration[5.0]
  def change
    add_column :responsibilities, :schedule_id, :integer
  end
end
