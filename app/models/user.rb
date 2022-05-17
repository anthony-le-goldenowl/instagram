class User < ApplicationRecord
  validate :avatar_presence

  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def avatar_presence
    errors.add(:avatar, "can't be blank") unless avatar.attached?
  end
end
