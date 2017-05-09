class Position < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :setups
  has_many :responsibilities

  def number_of_positions
  end

end
