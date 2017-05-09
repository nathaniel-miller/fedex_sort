class SortType < ApplicationRecord
  belongs_to :roster
  belongs_to :setup

  has_and_belongs_to_many :schedules
end
