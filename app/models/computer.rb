class Computer < ApplicationRecord
  belongs_to :client

  def end_of_life_class
    if endoflife <= Date.today + 1.year
      'end-life-danger' # Rouge
    elsif endoflife <= Date.today + 2.years
      'end-life-warning' # Orange
    else
      'end-life-success' # Vert
    end
  end

  def hostname_present?
    hostname.present?
  end
end
