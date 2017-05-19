class AddUnavailableEndDateToTeamMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :unavailable_end_date, :date
  end
end
