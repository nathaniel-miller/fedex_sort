module SchedulesHelper
  def columns
    @schedule.dates.count + 1
  end
end
