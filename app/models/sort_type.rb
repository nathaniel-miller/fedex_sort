class SortType < ApplicationRecord
  belongs_to :roster
  belongs_to :setup

  has_many :sorts
end
