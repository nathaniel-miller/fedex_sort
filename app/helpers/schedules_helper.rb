module SchedulesHelper
  def columns
    @schedule.dates.count + 1
  end

  def get_sort(sort_type_id, date)
    @sorts.where(sort_type_id: sort_type_id).find_by(date: date)
  end
end
