module RGen
  attr_reader :team_members,
              :team_members_with_pps,
              :positions,
              :r,
              :team_member

  #Expects to be used by the Sort class.
  #Each Sort object is the intersection of a date and a sort type.
  #If a schedule has 5 dates and 3 sort_types it will have 15 sorts.

  #A Responsibility object is created for every position in a sort.
  # If a sort type setup has 5 positions, that sort will have 5 responsibilities
  # - 1 for each position.

  #A team_member member is then assigned to cover that responsibility.

  def generate_responsibilities
    set_positions
    set_team_members
    cache_tms_with_pps
    create_responsibilities
    assign_responsibilities


    # assign_team_members
  end





  protected

  def set_positions
    @positions = sort_type.setup.positions
  end

  def set_team_members
    @team_members = sort_type.roster.team_members
    check_for_unavailable_team_members
  end

  def cache_tms_with_pps
    @team_members_with_pps = team_members.reject do |tm|
      tm.permanent_positions.empty?
    end
  end

  def check_for_unavailable_team_members
    @team_members = team_members.reject do |team_member|
      is_unavailable?(team_member)
    end
  end

  def is_unavailable?(team_member)
    unavailable = false

    team_member.dates_unavailable.each do |date_data|
      if (Date.parse(date_data[1])..Date.parse(date_data[2])) === self.date
        unavailable = true
        break
      end
    end

    unavailable
  end

  def create_responsibilities
    positions.each do |p|
      responsibilities << Responsibility.create(
        position_id: p.id,
        position: p
      )
    end
  end

  def assign_responsibilities
    responsibilities.each do |responsibility|
      @r = responsibility

      check_for_permanent_positions

    end
  end

  def check_for_permanent_positions
      team_members_with_pps.each do |team_member|
        @team_member = team_member
        assign_permanent_position
      end
  end

  def assign_permanent_position
    team_member.permanent_positions.each do |pp|
      if r.position_id == pp[1].to_i && sort_type_id == pp[2].to_i
        r.update(
          team_member_id: team_member.id,
          team_member: team_member
        )
      end
    end
  end













  def assign_team_members
    responsibilities.each_with_index do |r, i|
      r.update(
        team_member_id: roster.team_members[i].id
      )

      r.team_member = roster.team_members[i]
    end
  end









# Check for permanent positions
# Each SORT is represented by a column (Each Sort Type is an individual sort)
# Each SORT has 1 responsibility for every position that that sort's sort type setup has.

# Responsibility 920 had a position and team_member (Nathaniel) -> Sort is not yet persisted.

end
