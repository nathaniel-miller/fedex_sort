class RemoveStartEndDatesColumnsFromTeamMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :team_members, :unavailable_start_date
    remove_column :team_members, :unavailable_end_date
  end
end
