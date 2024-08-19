class Computer < ApplicationRecord
  belongs_to :client

  # Validations
  validates :hostname, :assigned_to, :os, :processor, :memory, presence: true
  validates :antivirus_name, presence: true, if: -> { antivirus_duration.present? }

  # Calcul de la date de fin de l'antivirus
  before_save :calculate_antivirus_end_date

  def calculate_antivirus_end_date
    if antivirus_start_date.present? && antivirus_duration.present?
      self.date_fin_antivirus = antivirus_start_date + antivirus_duration.years
    end
  end

  # Code couleur pour la date d'expiration de l'antivirus
  def antivirus_expiry_class
    if date_fin_antivirus && date_fin_antivirus <= Date.today + 1.month
      'antivirus-expiry-danger' # Rouge
    elsif date_fin_antivirus && date_fin_antivirus <= Date.today + 3.months
      'antivirus-expiry-warning' # Orange
    else
      'antivirus-expiry-success' # Vert
    end
  end

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
