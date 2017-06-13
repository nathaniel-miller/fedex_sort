module SchedulesHelper
  def columns
    @schedule.dates.count + 1
  end

  def get_sort(sort_type_id, date)
    @sorts.where(sort_type_id: sort_type_id).find_by(date: date)
  end

  def start_time(sort_type_id, date)
    sort = get_sort(sort_type_id, date)
    start_time = ""
    start_time = sort.start_time.strftime("%H:%M") unless sort.nil?

    start_time
  end

  def display_position_header(sort_type_id, date)
    sort = get_sort(sort_type_id, date)
    header = ""
    header = "Position:" unless sort.nil?

    header
  end

  def get_team_members(sort_type)
    sort_type.roster.team_members
  end

  def position_name(sort_type_id, date, team_member_id)
    sort = get_sort(sort_type_id, date)

    if sort.nil?
      position_name = ""
    else
      r = sort.responsibilities.find_by(team_member_id: team_member_id)
      position_name = r.try(:position).try(:name) unless sort.nil?
    end

    position_name
  end

  def sort_data(sort_type_id)
    data = {}
    data[:dates] = ""
    data[:start_times] = ""
    data[:position_headers] = ""

    @dates.each do |date|
      d = "<td>#{date.strftime('%a. %b %d')}</td>"
      data[:dates] += d

      time = "<td>#{start_time(sort_type_id, date)}</td>"
      data[:start_times] += time

      header = "<th>#{display_position_header(sort_type_id, date)}</th>"
      data[:position_headers] += header
    end

    data
  end

  def position_data(sort_type_id, team_member_id)
    data = {}
    data[:names] = ""

    @dates.each do |date|
      name = "<td>#{position_name(sort_type_id, date, team_member_id)}</td>"
      data[:names] += name
    end

    data
  end
end
