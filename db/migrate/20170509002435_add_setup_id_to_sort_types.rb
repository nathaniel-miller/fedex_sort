class AddSetupIdToSortTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :sort_types, :setup_id, :integer
  end
end
