class Schedule < ApplicationRecord
  has_many :sorts
  belongs_to :user

  accepts_nested_attributes_for :sorts

  def dates
    start_date..end_date
  end




  def sorts_attributes=(attributes)
    a = attributes["0"]

    sort_type_ids = a["sort_type_ids"].reject!(&:empty?)
    sd = "#{a["start_date(1i)"]}/#{a["start_date(2i)"]}/#{a["start_date(3i)"]}"
    ed = "#{a["end_date(1i)"]}/#{a["end_date(2i)"]}/#{a["end_date(3i)"]}"

    sort_type_ids.each do |id|
      sort = Sort.new(
        sort_type_id: id,
        start_date: sd,
        end_date: ed
      )

      sort.generate_responsibilities
      sort.schedule = self
      self.sorts << sort
    end
  end

end
