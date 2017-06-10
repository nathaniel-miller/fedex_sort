class TeamMember < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rosters
  has_many :responsibilities

  def full_name
    "#{first_name} #{last_name}"
  end

  def unavailable_start_date
    #Here as a method for form submission
  end

  def unavailable_end_date
    #Here as a method for form submission
  end

  def newbie?
    days = DateTime.now.mjd - self.date_of_hire.mjd
    days < 28
  end

end
