class AddResponsibilityIdToTeamMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :responsibility_id, :integer
  end
end
