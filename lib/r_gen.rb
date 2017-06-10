module RGen
  def generate_responsibilities

    generate_positions
    generate_team_members


  end

  def generate_positions
    sort_type.setup.positions.each do |p|
      r = Responsibility.create
      r.position = p
      responsibilities << r
    end
  end

  def generate_team_members
    responsibilities.each_with_index do |r, i|
      r.team_member = sort_type.roster.team_members[i]
    end
  end


# Check for permanent positions

end
