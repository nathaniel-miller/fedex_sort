class AddNameToSetups < ActiveRecord::Migration[5.0]
  def change
    add_column :setups, :name, :string
  end
end
