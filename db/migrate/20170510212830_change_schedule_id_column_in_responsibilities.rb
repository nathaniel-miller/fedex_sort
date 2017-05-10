class ChangeScheduleIdColumnInResponsibilities < ActiveRecord::Migration[5.0]
  def change
    rename_column :responsibilities, :schedule_id, :sort_id
  end
end
