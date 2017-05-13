class SortType < ApplicationRecord
  belongs_to :roster
  belongs_to :setup
  has_many :sorts
  has_and_belongs_to_many :schedules

  # return array of integers (0-6) representing days Sun - Sat
  #for use with date.wday method
  def weekdays
    wdays = []
    wdays << 0 if sun
    wdays << 1 if mon
    wdays << 2 if tue
    wdays << 3 if wed
    wdays << 4 if thu
    wdays << 5 if fri
    wdays << 6 if Sat

    wdays
  end
end
