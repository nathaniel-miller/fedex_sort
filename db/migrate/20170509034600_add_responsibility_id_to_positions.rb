class AddResponsibilityIdToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :responsibility_id, :integer
  end
end
