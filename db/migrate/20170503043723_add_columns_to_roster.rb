class AddColumnsToRoster < ActiveRecord::Migration[5.0]
  def change
    add_column :rosters, :list_of_team_member_ids, :string, array: true, default: []
  end
end
