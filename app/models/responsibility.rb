class Responsibility < ApplicationRecord
  belongs_to :schedule
  has_one :team_member
  has_one :position
end
