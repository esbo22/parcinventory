class Client < ApplicationRecord
  has_many :computers, dependent: :destroy

  def name_present?
    name.present?
  end
end
