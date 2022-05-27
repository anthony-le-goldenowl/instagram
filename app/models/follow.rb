# == Schema Information
#
# Table name: follows
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :integer          not null
#  following_id :integer          not null
#
# Indexes
#
#  index_follows_on_follower_id                   (follower_id)
#  index_follows_on_following_id                  (following_id)
#  index_follows_on_following_id_and_follower_id  (following_id,follower_id) UNIQUE
#
class Follow < ApplicationRecord
  # Counter caching
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id',
                        counter_cache: :followings_count,
                        inverse_of: :following_relationships
  belongs_to :following, class_name: 'User', foreign_key: 'following_id',
                         counter_cache: :followers_count,
                         inverse_of: :follower_relationships
end
