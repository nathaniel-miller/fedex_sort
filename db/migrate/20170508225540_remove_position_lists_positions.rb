class RemovePositionListsPositions < ActiveRecord::Migration[5.0]
  def change
    drop_table :position_lists_positions
  end
end
