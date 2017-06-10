class RemoveExtraFromTeamMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :team_members, :extra
  end
end
