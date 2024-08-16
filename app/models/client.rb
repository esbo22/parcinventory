class Client < ApplicationRecord
  belongs_to :user
  has_many :computers, dependent: :destroy

  def name_present?
    name.present?
  end
end
