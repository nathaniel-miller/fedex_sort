class AddDayColumnsToSortType < ActiveRecord::Migration[5.0]
  def change
    add_column :sort_types, :mon, :boolean, default: false
    add_column :sort_types, :tue, :boolean, default: false
    add_column :sort_types, :wed, :boolean, default: false
    add_column :sort_types, :thu, :boolean, default: false
    add_column :sort_types, :fri, :boolean, default: false
    add_column :sort_types, :sat, :boolean, default: false
    add_column :sort_types, :sun, :boolean, default: false
  end
end
