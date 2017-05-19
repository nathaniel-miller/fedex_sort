class RemoveColumnsFromTeamMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :team_members, :vacation
    remove_column :team_members, :absent
  end
end
