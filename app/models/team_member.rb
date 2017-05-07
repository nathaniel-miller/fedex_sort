class TeamMember < ApplicationRecord
  has_and_belongs_to_many :users

  def full_name
    "#{first_name} #{last_name}"
  end
end
