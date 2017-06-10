class ReplacePermantPositionColumnInTeamMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :team_members, :permanent_position
    add_column :team_members, :permanent_positions, :text, array: true, default: []
  end
end
