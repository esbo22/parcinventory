class Client < ApplicationRecord
  has_many :computers

  def name_present?
    name.present?
  end
end
