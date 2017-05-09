class TeamMember < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rosters
  has_and_belongs_to_many :responsibilities

  def full_name
    "#{first_name} #{last_name}"
  end
end
