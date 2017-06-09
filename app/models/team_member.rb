class TeamMember < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rosters
  has_many :responsibilities

  def full_name
    "#{first_name} #{last_name}"
  end

  def unavailable_start_date
  end

  def unavailable_end_date
  end
  
end
