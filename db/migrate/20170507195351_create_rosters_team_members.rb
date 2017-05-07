class CreateRostersTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters_team_members do |t|
      t.references :roster, foreign_key: true
      t.references :team_member, foreign_key: true
    end
  end
end
