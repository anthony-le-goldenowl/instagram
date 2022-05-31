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
require "test_helper"

class PostReactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
