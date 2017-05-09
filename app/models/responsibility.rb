class Responsibility < ApplicationRecord
  belongs_to :schedule
  has_and_belongs_to_many :team_members
  has_and_belongs_to_many :positions
end
