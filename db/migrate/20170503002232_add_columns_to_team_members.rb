class AddColumnsToTeamMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :first_name, :string
    add_column :team_members, :last_name, :string
    add_column :team_members, :employee_number, :string
    add_column :team_members, :date_of_hire, :date
    add_column :team_members, :position_history, :string
    add_column :team_members, :vacation, :boolean, :default => false
    add_column :team_members, :absent, :boolean, :default => false
    add_column :team_members, :extra, :boolean, :default => false
    add_column :team_members, :light_duty, :boolean, :default => false
    add_column :team_members, :permanent_position, :integer, :default => 0
  end
end
