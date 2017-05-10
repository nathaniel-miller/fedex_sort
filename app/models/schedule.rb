class Schedule < ApplicationRecord
  has_many :sorts

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

  def generate_responsibilites

    sort_types
  end

end
