class AddUnavailableDatesToTeamMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :dates_unavailable, :text, array:true, default: []
  end
end
