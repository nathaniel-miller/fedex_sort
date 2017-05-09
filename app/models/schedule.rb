class Schedule < ApplicationRecord
  has_and_belongs_to_many :sort_types
  has_many :responsibilities

  def generate_responsibilites

    sort_types.each do |st|
      st.setup.positions.each do |p|
        r = Responsibility.create
        r.position = p
        responsibilities << r
      end
    end

    responsibilities

  end

end
