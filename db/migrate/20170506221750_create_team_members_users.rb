class CreateTeamMembersUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members_users do |t|
      t.references :team_member, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
