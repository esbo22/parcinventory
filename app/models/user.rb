class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :clients, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validate :avatar_size

  def avatar_thumbnail
    # avatar.variant(resize_to_fill: [150, 150]).processed (sans formatage)
    avatar.variant(resize_to_fill: [150, 150], format: :webp).processed
  end
  
  private

  def avatar_size
    if avatar.attached? && avatar.byte_size > 2.megabytes
      errors.add(:avatar, "L'avatar ne peut pas dépasser 2 MB")
    end
  end
end