class CreateResponsibilitiesTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :responsibilities_team_members do |t|
      t.references :responsibility, foreign_key: true
      t.references :team_member, foreign_key: true
    end
  end
end
