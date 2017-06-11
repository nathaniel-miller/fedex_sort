module RGen
  def generate_responsibilities

    generate_positions
    generate_team_members


  end

  def generate_positions
    sort_type.setup.positions.each do |p|
      r = Responsibility.create(position_id: p.id)
      r.position = p
      responsibilities << r
    end
  end

  def generate_team_members
    responsibilities.each_with_index do |r, i|
      r.update(
        team_member_id: sort_type.roster.team_members[i].id
      )

      r.team_member = sort_type.roster.team_members[i]
    end
  end


# Check for permanent positions
# Each SORT is represented by a column (Each Sort Type is an individual sort)
# Each SORT has 1 responsibility for every position that that sort's sort type setup has.

# Responsibility 920 had a position and team_member (Nathaniel) -> Sort is not yet persisted.

end
