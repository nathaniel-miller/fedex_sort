class Responsibility < ApplicationRecord
  belongs_to :sort
  has_one :team_member
  has_one :position
end
