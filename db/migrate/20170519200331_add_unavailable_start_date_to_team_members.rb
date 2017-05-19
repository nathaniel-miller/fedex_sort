class AddUnavailableStartDateToTeamMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :unavailable_start_date, :date
  end
end
