class Position < ApplicationRecord
  has_and_belongs_to_many :users

  def number_of_positions
  end

end
