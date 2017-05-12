module RGen
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
end
