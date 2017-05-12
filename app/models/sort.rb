class Sort < ApplicationRecord
  belongs_to :schedule
  belongs_to :sort_type
  has_many :responsibilities

  def generate_responsibilites

    sort_type.setup.positions.each do |p|
      r = Responsibility.create
      r.position = p
      responsibilities << r
    end

    responsibilities.each_with_index do |r, i|
      r.team_member = TeamMember.all[i]
    end

  end

  def sort_type_ids
    # handle array of sort types
  end



end
