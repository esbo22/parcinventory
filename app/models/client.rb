class Client < ApplicationRecord
  belongs_to :user
  has_many :computers, dependent: :destroy

  VALID_PHONE_REGEX = /\A0\d{9}\z/ # Commence par '0' suivi de 9 chiffres
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX, message: "doit contenir 10 chiffres et commencer par 0" }

  def name_present?
    name.present?
  end

  def formatted_phone
    return if phone.blank?  # Vérifie si le numéro est vide ou nil

    phone.gsub(/(\d{2})(?=\d)/, '\1 ').strip
  end
end