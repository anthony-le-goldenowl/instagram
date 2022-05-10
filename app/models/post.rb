class Post < ApplicationRecord
  validate :image_presence

  belongs_to :user
  has_many_attached :images

  def image_presence
    errors.add(:images, "can't be blank") unless images.attached?
  end
end
