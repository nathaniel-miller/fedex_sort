class AddColumnsToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :name, :string
    add_column :positions, :position_number, :string
    add_column :positions, :priority_level, :string
    add_column :positions, :light_duty_friendly, :boolean, :default => false
    add_column :positions, :newbie_friendly, :boolean, :default => false
    add_column :positions, :takes_extra, :boolean, :default => false
  end
end
