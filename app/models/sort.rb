require 'r_gen'

class Sort < ApplicationRecord
  belongs_to :schedule
  belongs_to :sort_type
  has_many :responsibilities

  include RGen

  def sort_type_ids
    # handle array of sort types
  end



end
