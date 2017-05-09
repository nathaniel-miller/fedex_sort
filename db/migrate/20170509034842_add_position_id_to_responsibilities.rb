class AddPositionIdToResponsibilities < ActiveRecord::Migration[5.0]
  def change
    add_column :responsibilities, :position_id, :integer
  end
end
