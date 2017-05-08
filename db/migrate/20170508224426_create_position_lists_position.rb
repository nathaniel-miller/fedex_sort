class CreatePositionListsPosition < ActiveRecord::Migration[5.0]
  def change
    create_table :position_lists_positions do |t|
      t.references :position_list, foreign_key: true
      t.references :position, foreign_key: true
    end
  end
end
