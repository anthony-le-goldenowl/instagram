# == Schema Information
#
# Table name: post_reactions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_post_reactions_on_post_id  (post_id)
#  index_post_reactions_on_user_id  (user_id)
#
class PostReaction < ApplicationRecord
  belongs_to :user
  belongs_to :post, class_name: 'Post', counter_cache: :likes_count
end
