class Schedule < ApplicationRecord
  has_many :sorts
  belongs_to :user
  has_and_belongs_to_many :sort_types

  accepts_nested_attributes_for :sorts


  def dates
    start_date..end_date
  end

  def create_sorts
    sort_types.each do |st|

      sort_dates = dates.to_a.select do |date|
        st.weekdays.include? date.wday
      end

      sort_dates.each do |date|
        sort = Sort.create(
          sort_type_id: st.id,
          date: date,
          start_time: st.start_time
        )
        sort.generate_responsibilities
        sort.schedule = self
        self.sorts << sort
      end
    end
  end

  def sorts_attributes=(attributes)
    a = attributes["0"]
    sort_type_ids = a["sort_type_ids"].reject!(&:empty?)
    # sd = "#{a["start_date(1i)"]}/#{a["start_date(2i)"]}/#{a["start_date(3i)"]}"
    # ed = "#{a["end_date(1i)"]}/#{a["end_date(2i)"]}/#{a["end_date(3i)"]}"


    #if schedules had an associated list of sort_types of it's own:
    sort_types.each do |st|
      wdays = st.weekdays
      dates_for_sorts = dates.to_a.select { |date| wdays.include? date.wday }


      dates_for_sorts.each do |date|
        sort = Sort.new
        sort.sort_type_id = st.id
        sort.date = date
        sort.generate_responsibilities
        sort.schedule = self
        self.sorts << sort
      end
    end

    sort_type_ids.each do |sort_type_id|

      sort = Sort.new(
        sort_type_id: sort_type_id,
        start_date: sd,
        end_date: ed
      )

      sort.generate_responsibilities
      sort.schedule = self
      self.sorts << sort
    end
  end

end
