class RemovePositionListIdFromColumnFromSortTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :sort_types, :product_list_id
  end
end
