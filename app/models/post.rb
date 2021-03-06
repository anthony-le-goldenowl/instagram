# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  caption     :string
#  likes_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Post < ApplicationRecord
  validate :image_presence
  validates_presence_of :caption

  belongs_to :user
  has_one_attached :image

  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  has_many :post_reactions
  has_many :users, through: :post_reactions

  after_commit :create_hash_tags, on: :create

  # hash tag
  def hash_tag_names
    caption.to_s.scan(/#\w+/).map { |name| name.gsub('#', '') }
  end

  def create_hash_tags
    # create hash_tags of Post
    hash_tag_names.each do |name|
      if HashTag.exists?(name: name)
        post_hash_tags.create(post_id: id, hash_tag_id: HashTag.find_by(name: name).id)
      else
        hash_tags.create(name: name)
      end
    end
  end

  # image validate 
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
