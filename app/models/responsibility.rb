class Responsibility < ApplicationRecord
  belongs_to :sort
  belongs_to :team_member
  belongs_to :position
end
