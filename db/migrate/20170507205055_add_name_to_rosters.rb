class AddNameToRosters < ActiveRecord::Migration[5.0]
  def change
    add_column :rosters, :name, :string
  end
end
