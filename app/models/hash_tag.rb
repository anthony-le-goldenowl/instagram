# == Schema Information
#
# Table name: hash_tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class HashTag < ApplicationRecord
  has_many :post_hash_tags
  has_many :posts, through: :post_hash_tags
end
