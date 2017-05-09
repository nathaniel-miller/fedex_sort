class Setup < ApplicationRecord
  has_and_belongs_to_many :positions
  has_many :sort_types
end
