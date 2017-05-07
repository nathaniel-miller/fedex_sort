class TeamMember < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rosters

  def full_name
    "#{first_name} #{last_name}"
  end
end
