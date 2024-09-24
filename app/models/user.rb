class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :clients, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validate :avatar_size
  
  private

  def avatar_size
    if avatar.attached? && avatar.byte_size > 2.megabytes
      errors.add(:avatar, "L'avatar ne peut pas dépasser 2 MB")
    end
  end
end