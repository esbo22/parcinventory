class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :clients, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  after_commit :resize_avatar, if: :avatar_attached?

  validate :avatar_size

  def avatar_thumbnail
    # avatar.variant(resize_to_fill: [150, 150]).processed (sans formatage)
    avatar.variant(resize_to_fill: [150, 150], format: :webp).processed
  end
  
  private

  def avatar_attached?
    avatar.attached?
  end


  def resize_avatar
    if avatar.attached?
      # Redimensionner et convertir l'image
      avatar.variant(resize_to_fill: [150, 150], format: :webp).processed
    else
      # Gérer le cas où aucun avatar n'est attaché
      Rails.logger.info "Aucun avatar n'est attaché."
    end
  end


  def avatar_size
    if avatar.attached? && avatar.byte_size > 2.megabytes
      errors.add(:avatar, "L'avatar ne peut pas dépasser 2 MB")
    end
  end
end
