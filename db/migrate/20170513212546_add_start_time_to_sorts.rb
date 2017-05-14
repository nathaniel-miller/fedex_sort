class AddStartTimeToSorts < ActiveRecord::Migration[5.0]
  def change
    add_column :sorts, :start_time, :time
  end
end
