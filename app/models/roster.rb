class Roster < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :team_members
  has_many :sort_types
end
