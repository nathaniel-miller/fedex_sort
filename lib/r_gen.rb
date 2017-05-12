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

  #Team Members from Roster only.
  #Check for vactions
  #Check for absents -> need something to set single dates here
  #Check for fixed positions
  #Check for light duty
  #Check for newbie

  # Will need sub groups - ex. list of newbie-friendly positions and new employees

end
