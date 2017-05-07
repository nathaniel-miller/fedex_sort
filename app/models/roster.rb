class Roster < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :team_members
end
