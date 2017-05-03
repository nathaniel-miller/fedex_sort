class AddColumnsToSortType < ActiveRecord::Migration[5.0]
  def change
    add_column :sort_types, :name, :string
    add_column :sort_types, :product_list_id, :integer
    add_column :sort_types, :roster_id, :integer
  end
end
