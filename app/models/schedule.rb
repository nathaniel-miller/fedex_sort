class Schedule < ApplicationRecord
  has_many :sorts
  accepts_nested_attributes_for :sorts
  belongs_to :user

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


  def sorts_attributes=(attributes)
    byebug
  end

end
