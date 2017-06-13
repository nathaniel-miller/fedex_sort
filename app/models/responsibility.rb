class Responsibility < ApplicationRecord
  belongs_to :sort
  belongs_to :team_member, optional: true
  belongs_to :position

end
