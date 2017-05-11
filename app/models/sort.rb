class Sort < ApplicationRecord
  belongs_to :schedule
  belongs_to :sort_type
  has_many :responsibilities

  def sort_type_ids
    # handle array of sort types
  end

end
