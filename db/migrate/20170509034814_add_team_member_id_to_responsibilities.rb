class AddTeamMemberIdToResponsibilities < ActiveRecord::Migration[5.0]
  def change
    add_column :responsibilities, :team_member_id, :integer
  end
end
