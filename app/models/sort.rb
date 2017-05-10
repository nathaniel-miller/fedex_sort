class Sort < ApplicationRecord
  belongs_to :schedule
  belongs_to :sort_type
  has_many :responsibilities
end
