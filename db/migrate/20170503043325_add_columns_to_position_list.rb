class AddColumnsToPositionList < ActiveRecord::Migration[5.0]
  def change
    add_column :position_lists, :list_of_position_ids, :string, array: true, default: []
  end
end
