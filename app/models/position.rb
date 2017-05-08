class Position < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :setups

  def number_of_positions
  end

end
