# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  validate :image_presence
  validates_presence_of :caption

  belongs_to :user
  has_one_attached :image

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
