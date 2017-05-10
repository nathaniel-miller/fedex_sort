class Sort < ApplicationRecord
  belongs_to :schedule
  has_many :responsibilities
end
