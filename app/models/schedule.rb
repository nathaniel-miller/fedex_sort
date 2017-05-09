class Schedule < ApplicationRecord
  has_and_belongs_to_many :sort_types
  has_many :responsibilities
end
