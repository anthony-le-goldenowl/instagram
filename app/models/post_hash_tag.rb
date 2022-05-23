# == Schema Information
#
# Table name: post_hash_tags
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hash_tag_id :bigint
#  post_id     :bigint
#
# Indexes
#
#  index_post_hash_tags_on_hash_tag_id  (hash_tag_id)
#  index_post_hash_tags_on_post_id      (post_id)
#
class PostHashTag < ApplicationRecord
  belongs_to :post
  belongs_to :hash_tag
end
