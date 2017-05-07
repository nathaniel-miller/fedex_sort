class DropListOfTeamMemberIdsFromRosters < ActiveRecord::Migration[5.0]
  def change
    remove_column :rosters, :list_of_team_member_ids
  end
end
